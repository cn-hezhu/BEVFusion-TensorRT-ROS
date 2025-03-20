/*
 * @Author: Mandy
 * @Date: 2023-08-13 13:10:57
 * @Last Modified by:   Mandy
 * @Last Modified time: 2023-08-13 13:10:57
 */
#ifndef __FUSEHEAD_HPP__
#define __FUSEHEAD_HPP__

#include <memory>
#include <string>
#include <vector>

#include "common/dtype.hpp"

namespace bevfusion {
namespace head {

struct BindingOut{
  float* cls_scores;
  int32_t* dir_cls_scores;
  float* bbox_preds;
};

class AnchorHead {
 public:
  virtual BindingOut forward(const nvtype::half* camera_bev, void* stream) = 0;
  virtual void print() = 0;
  virtual std::vector<std::vector<int>> output_shape() = 0;
};

std::shared_ptr<AnchorHead> create_head(const std::string& model);

};  // namespace head
};  // namespace bevfusion

#endif  // __FUSEHEAD_HPP__