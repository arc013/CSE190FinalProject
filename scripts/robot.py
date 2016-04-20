#!/usr/bin/env python
# license removed for brevity
import rospy
import sys
import math
from std_msgs.msg import Bool, String, Float32
from cse_190_assi_1.msg import temperatureMessage
from cse_190_assi_1.srv import requestTexture 
from cse_190_assi_1.srv import requestMapData, moveService
from read_config import read_config
from cse_190_assi_1.msg import RobotProbabilities

i=0
pubForShutdown = rospy.Publisher('/map_node/sim_complete', Bool, queue_size=10)
pubForProb=rospy.Publisher('/results/probabilities', RobotProbabilities, queue_size=10)

pubForTemp=rospy.Publisher('/results/temperature_data', Float32, queue_size=10)
pubForTex=rospy.Publisher('/results/texture_data', String, queue_size=10)
pubForComplete=rospy.Publisher('/map_node/sim_complete', Bool, queue_size=10)


tempMap=read_config()["pipe_map"]
textureMap=read_config()["texture_map"]
localMap=[]
ProbMap=[]
cleanMap=[]
posX = None
posY = None
height=len(read_config()["pipe_map"])
length=len(read_config()["pipe_map"][0])
numR= None
numS= None
numCells=height*length
totalR=0
totalS=0







def callBack(data):
		
	global i, height, length, cleanMap, ProbMap, localMap, numCells, totalR
	global totalS, pubForShutdown, pubForProb, pubForTemp, pubForTex, numR
	global pubForComplete, numS
	pubForTemp.publish(data.temperature)
	tempNoiseStd=read_config()["temp_noise_std_dev"]
	numMoves=len(read_config()["move_list"])



#print localMap
	
        #temperature
	for j in range (0, height):
	     for k in range (0, length):
		     if tempMap[j][k]=='C':
		        temp=20
		     elif tempMap[j][k]=='-':
		        temp=25
		     else:
		        temp=40
		     gaussian=(1.0/(tempNoiseStd*math.sqrt(2*math.pi)))*math.pow(math.e,
				     -1.0*math.pow((data.temperature-temp),2)/(2*math.pow(tempNoiseStd,
						     2)))
		   
# average=(gaussian+localMap[j][k]/2)
	             localMap[j][k]*=gaussian




	totalSum=0
	for j in range (0, height):
		for k in range (0, length):
			totalSum+=localMap[j][k]


#print "totalSum: ", totalSum
	for j in range (0, height):
		for k in range (0, length):
			localMap[j][k]/=totalSum

	
	





        #texture 
	rospy.wait_for_service('requestTexture')
# print "tempperature is: ", data.temperature
#	print "numR and numS are:", numR, numS
	totalR=0
	totalS=0

        try:
           robotTexture = rospy.ServiceProxy('requestTexture', requestTexture)
	   pubForTex.publish(robotTexture().data)
#  print robotTexture().data



#test1=[]
#test1+=[robotTexture().data]
#print test1





	   probTex=read_config()["prob_tex_correct"]
	   for j in range (0, height):
	     for k in range (0, length):
		     if textureMap[j][k]=='R':
		        totalR+=localMap[j][k]
		     else:
		        totalS+=localMap[j][k]
		     

   		     
# print "totalR and totalS", totalR, totalS
# print localMap

	   kForR=(numR*probTex)*(totalR/numR)+(numS*(1-probTex))*(totalS/numS)
	   kForS=(numR*(1-probTex))*(totalR/numR)+(numS*probTex)*(totalS/numS)
#print "k for R and S:", kForR, kForS
	   consK=kForS
	   tex='S'
	   if robotTexture().data=='R':
	      tex='R'
	      consK=kForR
	   for j in range (0, height):
	      for k in range (0, length):
		      if textureMap[j][k]==tex:
		         localMap[j][k]*= probTex
		      else:
		         localMap[j][k]*= (1-probTex)

           totalSum=0
           for j in range (0, height):
	     for k in range (0, length):
		     totalSum+=localMap[j][k]
	   for j in range (0, height):
	     for k in range (0, length):
		     localMap[j][k]/=totalSum

           


	   
#print localMap
	   mySum=0.0
	   for y in range (0, height):
	      for z in range (0, length):
		      mySum+=localMap[y][z]
#  print "sum is   :", mySum
           # print localMap

	   if i>= numMoves: 
	      result=[]
              for j in range (0, height):
		   result+=localMap[j]
#   print result
#	   print localMap
	      pubForProb.publish(result)
	      pubForComplete.publish(True)
#pubForShutdown.publish(True)
	      rospy.sleep(3)
              rospy.signal_shutdown("No more moves left")

	   
           
#i=i+1
	   rospy.wait_for_service('moveService')
	   try: 
              robotMove = rospy.ServiceProxy('moveService',
					 moveService)
	      move=read_config()["move_list"][i]
	      i=i+1
	      robotMove(move)

           except rospy.ServiceException, e:
	      print "Service call failed: %s"%e


	   probMove=read_config()["prob_move_correct"]

           #updating belief for moving
	   possibleMoves=read_config()["possible_moves"]
	   lengthPossibleMoves=len(read_config()["possible_moves"])
#print localMap, ProbMap
	   for j in range (0, height):
		   for k in range (0, length):

		       #correct move
		     
		       xCord= (k+move[1]) % length
		       yCord= (j+move[0]) % height
	               ProbMap[yCord][xCord]+=probMove*localMap[j][k]
		       m=0
                       #incorrect Moves
		       while m<lengthPossibleMoves:
		          if possibleMoves[m]!=move:
#print move, possibleMoves[m]
			     xCord= (k+possibleMoves[m][1]) % length
		             yCord=( j+possibleMoves[m][0]) % height
# print "%d %d", xCord, length, yCord, height
			     ProbMap[yCord][xCord]+=((1-probMove)/(lengthPossibleMoves-1))*localMap[j][k]
			  m=m+1



	   
	   checkSum=0
	   for j in range (0, height):
	    for k in range (0, length):
		    localMap[j][k]=ProbMap[j][k]
		    ProbMap[j][k]=0
		    checkSum+=localMap[j][k]





           result=[]
	   
           for j in range (0, height):
		   result+=localMap[j]
        
	          




	

#   print result
#	   print localMap
	   pubForProb.publish(result)
#rospy.sleep(3)







#print "move to pos: ", move
           #	rospy.loginfo("is this printing")
#return robotTexture
        except rospy.ServiceException, e:
	   print "Service call failed: %s"%e




	
	    

def robot():
    
    global height
    global length
    global localMap, ProbMap, cleanMap, textureMap, numR, numS
    numR=0
    numS=0
    for j in range (0, height):
	    row =[]
	    row2=[]
	    for k in range (0, length):
		    if textureMap[j][k]=='R':
		       numR+=1
		    else:
		       numS+=1
		    row.append(1.0/(height*length))
		    row2.append(0)
	    localMap.append(row)
	    ProbMap.append(row2)
	   
#print ProbMap
#start=read_config()["starting_pos"]
#   global posX, posY
# posX=start[0]
# posY=start[1]
# localMap[start[0]][start[1]]=1
    


    pub = rospy.Publisher('/temp_sensor/activation', Bool, queue_size=10)
    tempMess=rospy.Subscriber("/temp_sensor/data", temperatureMessage,
		      callBack)

    rospy.init_node('robot.py', anonymous=True)
    rate=rospy.Rate(1)
    while not rospy.is_shutdown():
	    pub.publish(True)
	    rate.sleep()


#rate = rospy.Rate(10) #10hz
   #print "move to pos: "
    
        

    maxloop=len(read_config()["move_list"])
#while i < maxloop :
      
          

    rospy.spin();
    
#rospy.spin();
# while not rospy.is_shutdown():
#       hello_str = "hello world %s" % rospy.get_time()
#       rospy.loginfo(hello_str)
#       pub.publish(hello_str)
#       rate.sleep()

if __name__ == '__main__':
    try:
        robot()
    except rospy.ROSInterruptException:
        pass
