#ifndef bevfusion_ros_h
#define bevfusion_ros_h


#include "bevfusion_plugin.hpp"

#include <ros/ros.h>
// message_filters消息同步器
#include <message_filters/subscriber.h>
#include <message_filters/synchronizer.h>
#include <message_filters/sync_policies/approximate_time.h> // 时间接近

// 图像
#include <opencv2/opencv.hpp>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/Image.h>

// 点云
#include <pcl/io/pcd_io.h>
#include <pcl/point_types.h>
#include <pcl/filters/passthrough.h>
#include <pcl_conversions/pcl_conversions.h>
#include <sensor_msgs/PointCloud2.h>


class RosNode
{
  std::string model_name_, precition_;
  ros::NodeHandle n_;
  ros::Publisher pub_img_;
  ros::Publisher pub_objects_;
  ros::Publisher pub_detect_visualization_;

  std::string topic_cloud_;
  std::string topic_img_l_, topic_img_f_, topic_img_b_, topic_img_r_;

  message_filters::Subscriber<sensor_msgs::PointCloud2> sub_cloud_;
  message_filters::Subscriber<sensor_msgs::Image> sub_l_img_;
  message_filters::Subscriber<sensor_msgs::Image> sub_f_img_;
  message_filters::Subscriber<sensor_msgs::Image> sub_b_img_;
  message_filters::Subscriber<sensor_msgs::Image> sub_r_img_;

  typedef message_filters::sync_policies::ApproximateTime<
    sensor_msgs::PointCloud2,
    sensor_msgs::Image, sensor_msgs::Image,
    sensor_msgs::Image, sensor_msgs::Image> MySyncPolicy;

  typedef message_filters::Synchronizer<MySyncPolicy> Sync;
	std::shared_ptr<Sync> sync_;

  std::shared_ptr<BEVFusionNode> bevfusion_node_;

 public:
  RosNode(const std::string model_name, const std::string  precision);
  ~RosNode(){};
  void getTopicName();
  void pubDetectedObject(const std::vector<bevfusion::head::transbbox::BoundingBox> &detections, const std_msgs::Header &in_header);
  void callback(const sensor_msgs::PointCloud2ConstPtr& msg_cloud,
    const sensor_msgs::ImageConstPtr& msg_l_img,
    const sensor_msgs::ImageConstPtr& msg_f_img,
    const sensor_msgs::ImageConstPtr& msg_b_img,
    const sensor_msgs::ImageConstPtr& msg_r_img);
};

#endif