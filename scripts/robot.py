#!/usr/bin/env python
# license removed for brevity
import rospy
import sys
from std_msgs.msg import Bool
from cse_190_assi_1.msg import temperatureMessage
from cse_190_assi_1.srv import requestTexture 
from cse_190_assi_1.srv import requestMapData, moveService
from read_config import read_config

i=0
pubForShutdown = rospy.Publisher('/map_node/sim_complete', Bool, queue_size=10)
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
numCell=height*length







def callBack(data):
	print "tempperature is: ", data.temperature

	global i, height, length, cleanMap, ProbMap, localMap, numCell
	rospy.wait_for_service('requestTexture')
        try:
           robotTexture = rospy.ServiceProxy('requestTexture', requestTexture)
	   print robotTexture().data


	   probTex=read_config()["prob_tex_correct"]
	   kForR=(numR*probTex)/(length*height)+(numS*(1-probTex))/(length*height)
	   kForS=(numR*(1-probTex))/(length*height)+(numS*probTex)/(length*height)
	   consK=kForS
	   tex='S'
	   if robotTexture().data=='R':
	      tex='R'
	      consK=kForR
	   for j in range (0, height):
	      for k in range (0, length):
		      if textureMap[j][k]==tex:
		         localMap[j][k]*= probTex/(consK)
		      else:
		         localMap[j][k]*= (1-probTex)/consK





	   numMoves=len(read_config()["move_list"])
           move=read_config()["move_list"][i]
           i=i+1
	   rospy.wait_for_service('moveService')
	   try: 
              robotMove = rospy.ServiceProxy('moveService',
					 moveService)
           except rospy.ServiceException, e:
	      print "Service call failed: %s"%e

	   print localMap
	   mySum=0.0
	   for j in range (0, height):
	      for k in range (0, length):
		      mySum+=localMap[j][k]
	   print mySum

	   robotMove(move)
	   probMove=read_config()["prob_move_correct"]

           #updating belief for moving
	   possibleMoves=read_config()["possible_moves"]
	   lengthPossibleMoves=len(read_config()["possible_moves"])
#print localMap, ProbMap
	   '''for j in range (0, height):
		   for k in range (0, length):

		       #correct move
		     
		       xCord= (k+move[0]) % length
		       yCord= (j+move[1]) % height
	               ProbMap[yCord][xCord]+=probMove*localMap[j][k]
		       m=0
                       #incorrect Moves
		       while m<lengthPossibleMoves:
		          if possibleMoves[m]!=move:
#print move, possibleMoves[m]
			     xCord= (k+possibleMoves[m][0]) % length
		             yCord=( j+possibleMoves[m][1]) % height
# print "%d %d", xCord, length, yCord, height
			     ProbMap[yCord][xCord]+=((1-probMove)/(lengthPossibleMoves-1))*localMap[j][k]
			  m=m+1'''



	   
	   
	   '''for j in range (0, height):
	    for k in range (0, length):
		    localMap[j][k]=ProbMap[j][k]
		    ProbMap[j][k]=0'''







# print localMap
	   if i>= numMoves: 
	      global pubForShutdown
	      pubForShutdown.publish(True)
              rospy.signal_shutdown("No more moves left")


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
    rate=rospy.Rate(10)
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
