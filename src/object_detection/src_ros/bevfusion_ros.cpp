#define STB_IMAGE_IMPLEMENTATION
#define STB_IMAGE_WRITE_IMPLEMENTATION  // 预处理器宏定义

#include "bevfusion_ros.hpp"

#include <tf/transform_datatypes.h>
#include "autoware_msgs/DetectedObjectArray.h"
#include "autoware_msgs/DetectedObject.h"
#include <jsk_recognition_msgs/BoundingBox.h>
#include <jsk_recognition_msgs/BoundingBoxArray.h>

# define CAR_SCORE    0.8
# define TRUCK_SCORE  0.8
# define CAR_SCORE_VIS    0.8
# define TRUCK_SCORE_VIS  0.8

int car_number = 0;
int truck_number = 0;

RosNode::RosNode(const std::string model_name, const std::string  precision)
  : model_name_(model_name), precition_(precision)
{

  bevfusion_node_.reset(new BEVFusionNode(model_name_, precition_));
  printf("Init Model\n");
  getTopicName();
  pub_img_ = n_.advertise<sensor_msgs::Image>("/bevfusion/image_raw", 10);
  pub_objects_ = n_.advertise<autoware_msgs::DetectedObjectArray>("/detection/lidar_detector/objects", 1);
  pub_detect_visualization_ = n_.advertise<jsk_recognition_msgs::BoundingBoxArray>("/detection/lidar_detector/visualization", 1);
  sub_cloud_.subscribe(n_, topic_cloud_, 10);
  sub_l_img_.subscribe(n_,topic_img_l_, 10);
  sub_f_img_.subscribe(n_, topic_img_f_, 10);
  sub_b_img_.subscribe(n_, topic_img_b_, 10);
  sub_r_img_.subscribe(n_,topic_img_r_, 10);

  sync_ = std::make_shared<Sync>( MySyncPolicy(10), sub_cloud_, sub_l_img_, sub_f_img_, sub_b_img_, sub_r_img_);

  sync_->registerCallback(boost::bind(&RosNode::callback,this, _1, _2, _3, _4, _5)); // 绑定回调函数
  }

void RosNode::getTopicName()
{
  n_.param<std::string>("topic_cloud", topic_cloud_, "/velodyne_points");
  n_.param<std::string>("topic_img_l", topic_img_l_, "/img/cam_a");
  n_.param<std::string>("topic_img_b", topic_img_b_, "/img/cam_b");
  n_.param<std::string>("topic_img_r", topic_img_r_, "/img/cam_c");
  n_.param<std::string>("topic_img_f", topic_img_f_, "/img/cam_d");
}

void RosNode::pubDetectedObject(const std::vector<bevfusion::head::transbbox::BoundingBox> &detections, const std_msgs::Header &in_header)
{
  autoware_msgs::DetectedObjectArray objects;
  objects.header = in_header;
  objects.header.frame_id = "lidar";
  int num_objects = detections.size();
  for (int i = 0; i < num_objects; i++)
  {
    if (detections[i].id == 0 && detections[i].score > CAR_SCORE)
    {
      autoware_msgs::DetectedObject object;
      object.header = in_header;
      object.valid = true;
      object.pose_reliable = true;
      // pose
      object.pose.position.x = detections[i].position.x;
      object.pose.position.y = detections[i].position.y;
      object.pose.position.z = detections[i].position.z;
      // yaw
      float yaw = detections[i].z_rotation;
      yaw += M_PI / 2;
      yaw = std::atan2(std::sin(yaw), std::cos(yaw));
      object.angle = yaw;
      geometry_msgs::Quaternion q = tf::createQuaternionMsgFromYaw(yaw);
      object.pose.orientation = q;
      // dimensions
      object.dimensions.x = detections[i].size.l;
      object.dimensions.y = detections[i].size.w;
      object.dimensions.z = detections[i].size.h;
      // score
      object.score = detections[i].score;
      // label
      object.label = "Car";
      objects.objects.push_back(object);
      ROS_INFO("detect label %s , score %f ...", object.label.c_str(), object.score);
      ROS_INFO("direct detect object %.2f %.2f %.2f %.2f", \
                  object.pose.position.x, object.pose.position.y, object.pose.position.z, object.angle);
      car_number = car_number + 1;
    }
    else if (detections[i].id == 1 && detections[i].score > TRUCK_SCORE)
    {
      autoware_msgs::DetectedObject object;
      object.header = in_header;
      object.valid = true;
      object.pose_reliable = true;
      // pose
      object.pose.position.x = detections[i].position.x;
      object.pose.position.y = detections[i].position.y;
      object.pose.position.z = detections[i].position.z;
      // yaw
      float yaw = detections[i].z_rotation;
      yaw += M_PI / 2;
      yaw = std::atan2(std::sin(yaw), std::cos(yaw));
      object.angle = yaw;
      geometry_msgs::Quaternion q = tf::createQuaternionMsgFromYaw(yaw);
      object.pose.orientation = q;
      // dimensions
      object.dimensions.x = detections[i].size.l;
      object.dimensions.y = detections[i].size.w;
      object.dimensions.z = detections[i].size.h;
      // score
      object.score = detections[i].score;
      // label
      object.label = "Truck";
      objects.objects.push_back(object);
      ROS_INFO("detect label %s , score %f ...", object.label.c_str(), object.score);
      ROS_INFO("direct detect object %.2f %.2f %.2f %.2f", \
                  object.pose.position.x, object.pose.position.y, object.pose.position.z, object.angle);
      truck_number = truck_number + 1;
    }
    else
    {
      continue;
    }
  }
  pub_objects_.publish(objects);
  // visualization bbox
  jsk_recognition_msgs::BoundingBoxArray bbox_array;
  bbox_array.header = in_header;
  bbox_array.header.frame_id = "velodyne";
  for (int i = 0; i < num_objects; i++)
  {
    if (detections[i].id == 0 && detections[i].score > CAR_SCORE_VIS)
    {
      jsk_recognition_msgs::BoundingBox bbox;
      bbox.header = in_header;
      // pose
      bbox.pose.position.x = detections[i].position.x;
      bbox.pose.position.y = detections[i].position.y;
      bbox.pose.position.z = detections[i].position.z;
      // yaw
      float yaw = detections[i].z_rotation;
      yaw += M_PI / 2;
      yaw = std::atan2(std::sin(yaw), std::cos(yaw));
      geometry_msgs::Quaternion q = tf::createQuaternionMsgFromYaw(yaw);
      bbox.pose.orientation.x = q.x;
      bbox.pose.orientation.y = q.y;
      bbox.pose.orientation.z = q.z;
      bbox.pose.orientation.w = q.w;
      // dimensions
      bbox.dimensions.x = detections[i].size.l;
      bbox.dimensions.y = detections[i].size.w;
      bbox.dimensions.z = detections[i].size.h;
      // score
      bbox.value = detections[i].score;
      // label
      bbox.label = detections[i].id;
      bbox_array.boxes.push_back(bbox);
    }
    else if (detections[i].id == 1 && detections[i].score > TRUCK_SCORE_VIS)
    {
      jsk_recognition_msgs::BoundingBox bbox;
      bbox.header = in_header;
      // pose
      bbox.pose.position.x = detections[i].position.x;
      bbox.pose.position.y = detections[i].position.y;
      bbox.pose.position.z = detections[i].position.z;
      // yaw
      float yaw = detections[i].z_rotation;
      yaw += M_PI / 2;
      yaw = std::atan2(std::sin(yaw), std::cos(yaw));
      geometry_msgs::Quaternion q = tf::createQuaternionMsgFromYaw(yaw);
      bbox.pose.orientation.x = q.x;
      bbox.pose.orientation.y = q.y;
      bbox.pose.orientation.z = q.z;
      bbox.pose.orientation.w = q.w;
      // dimensions
      bbox.dimensions.x = detections[i].size.l;
      bbox.dimensions.y = detections[i].size.w;
      bbox.dimensions.z = detections[i].size.h;
      // score
      bbox.value = detections[i].score;
      // label
      bbox.label = detections[i].id;
      bbox_array.boxes.push_back(bbox);
    }
    else
    {
      continue;
    }
  }
  pub_detect_visualization_.publish(bbox_array);
  ROS_INFO("Car number %d ", car_number);
  ROS_INFO("Truck number %d ", truck_number);
}

void RosNode::callback(const sensor_msgs::PointCloud2ConstPtr& msg_cloud,
  const sensor_msgs::ImageConstPtr& msg_l_img,
  const sensor_msgs::ImageConstPtr& msg_f_img,
  const sensor_msgs::ImageConstPtr& msg_b_img,
  const sensor_msgs::ImageConstPtr& msg_r_img)
{

  cv::Mat l_img, f_img, b_img, r_img;
  pcl::PointCloud<pcl::PointXYZI>::Ptr cloud_ptr(new pcl::PointCloud<pcl::PointXYZI>());

  pcl::fromROSMsg(*msg_cloud, *cloud_ptr);
  l_img  = cv_bridge::toCvShare(msg_l_img , "bgr8")->image;
  f_img = cv_bridge::toCvShare(msg_f_img, "bgr8")->image;
  b_img = cv_bridge::toCvShare(msg_b_img, "bgr8")->image;
  r_img  = cv_bridge::toCvShare(msg_r_img , "bgr8")->image;

  std::vector<unsigned char *> images = load_images(l_img, f_img, b_img, r_img);

  // printf("size: %ld \n", cloud_ptr->points.size());

  int lidar_num = cloud_ptr->points.size();
  float lidar_arr[lidar_num * 5];
  for(size_t i = 0; i < cloud_ptr->points.size(); ++i )
  {
    long index = i * 5;
    lidar_arr[index]     = cloud_ptr->points[i].x;
    lidar_arr[index + 1] = cloud_ptr->points[i].y;
    lidar_arr[index + 2] = cloud_ptr->points[i].z;
    lidar_arr[index + 3] = cloud_ptr->points[i].intensity;
    // lidar_arr[index + 4] = cloud->points[i].time;
    lidar_arr[index + 4] = 0;
  }
  auto out_detections = bevfusion_node_->Inference(images, lidar_arr, cloud_ptr->points.size());

  int num_objects = out_detections.size();
  ROS_INFO("detect objects %d ...", num_objects);

  pubDetectedObject(out_detections, msg_cloud->header);

  for (size_t i = 0; i < images.size(); ++i)
    stbi_image_free(images[i]);
  images.clear();

  cv::Mat img = cv::imread((pkg_path + "/configs/cuda-bevfusion.jpg").c_str());
  cv::resize(img, img, cv::Size(img.size().width /2, img.size().height /2));
  sensor_msgs::Image::Ptr msg_img_new;
  msg_img_new = cv_bridge::CvImage(std_msgs::Header(), "bgr8", img).toImageMsg();
  pub_img_.publish(msg_img_new);

}
