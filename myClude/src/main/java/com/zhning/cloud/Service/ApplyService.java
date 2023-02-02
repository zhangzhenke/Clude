package com.zhning.cloud.Service;


import com.zhning.cloud.Mapper.ApplyMapper;
import com.zhning.cloud.Model.Apply;
import com.zhning.cloud.Model.File;
import com.zhning.cloud.Model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service(value="applyService")
public class ApplyService {
    @Autowired
    private ApplyMapper dao;
//创建申请
    public int createApply(Apply apply) throws Exception {
       return dao.createApply(apply);
    }

    //检测是否重复创建
    public String checkApply(String applymanname,String applydesc) throws Exception {

     List<Integer> list =  dao.findApply(applymanname,applydesc);
      if(list.size()>0){
          return "ok";
      }
      return "no";
    }

}
