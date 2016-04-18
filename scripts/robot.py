#!/usr/bin/env python
# license removed for brevity
import rospy
import sys
from std_msgs.msg import Bool
from cse_190_assi_1.msg import temperatureMessage
from cse_190_assi_1.srv import requestTexture 
from cse_190_assi_1.srv import requestMapData, moveService
from read_config import read_config



	
	    

def robot():
    i=0
    
    pub = rospy.Publisher('/temp_sensor/activation', Bool, queue_size=10)
    rospy.init_node('robot.py', anonymous=True)
#rate = rospy.Rate(10) #10hz
    pub.publish(True);
    print "move to pos: "
    maxloop=len(read_config()["move_list"])
    while i < maxloop :
      tempMess=rospy.Subscriber("/temp_sensor/data", temperatureMessage)

      rospy.wait_for_service('requestTexture')
      try:
         robotTexture = rospy.ServiceProxy('requestTexture', requestTexture)
         move=read_config()["move_list"][i]
         i=i+1
         rospy.wait_for_service('requestTexture')
#print "move to pos: ", move
         try: 
            robotMove = rospy.ServiceProxy('moveService',
					 moveService)
            robotMove(move)
         except rospy.ServiceException, e:
	    print "Service call failed: %s"%e

#	rospy.loginfo("is this printing")
#return robotTexture
      except rospy.ServiceException, e:
	 print "Service call failed: %s"%e
    



    




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
