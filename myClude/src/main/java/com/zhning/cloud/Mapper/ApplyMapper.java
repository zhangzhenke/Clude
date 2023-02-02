package com.zhning.cloud.Mapper;

import com.zhning.cloud.Model.Apply;
import com.zhning.cloud.Model.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ApplyMapper {

    @Insert("INSERT INTO apply(applymanname,applydesc,createtime,comment) VALUES(#{applymanname},#{applydesc},#{createtime},#{comment})")
    public Integer createApply(Apply apply) throws Exception;

    @Select("SELECT apply.id FROM apply WHERE applymanname=#{applymanname} AND applydesc=#{applydesc}")
    public List<Integer> findApply(String applymanname, String applydesc) throws Exception;
}
