<template>
  <div>
    <!-- 面包屑导航 -->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/home' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>用户管理</el-breadcrumb-item>
      <el-breadcrumb-item>权限审核</el-breadcrumb-item>
    </el-breadcrumb>
    <!-- 卡片视图区 -->
    <el-card>
      <el-row :gutter="25">
        <el-col :span="10">
          <!-- 搜索添加 -->
          <el-input placeholder="请输入搜索内容" v-model="queryInfo.query" clearable @clear="getUserList">
            <el-button slot="append" icon="el-icon-search" @click="getUserList"></el-button>
          </el-input>
        </el-col>
      </el-row>
      <!-- 用户列表 -->
      <el-table
   :data="userlist" border stripe
    style="width: 100%">
    <el-table-column type="index"  fixed></el-table-column>
    <el-table-column
      prop="createtime1"
      label="申请时间"
      width="150">
    </el-table-column>
    <el-table-column
      prop="applymanname"
      label="申请人姓名"
      width="120">
    </el-table-column>
    <el-table-column
      prop="applydesc"
      label="申请权限类型"
      width="120">
    </el-table-column>
    <el-table-column
      prop="comment"
      label="备注"
      width="120">
    </el-table-column>


     <el-table-column  prop="isvip"  label="开通vip"    width="120">
        <template slot-scope="scope">
   <el-switch v-model="scope.row.isvip" @change="applyIsvipChanged(scope.row)"  active-color="yellow"></el-switch>
        </template>
    </el-table-column>
    
    <el-table-column label="开通管理员" prop="isadmin">
          <!-- scope.row 就是当前行的信息 -->
          <template slot-scope="scope">
            <el-switch v-model="scope.row.isadmin" @change="applyIsadminChanged(scope.row)" active-color="green"></el-switch>
          </template>
        </el-table-column>

    <el-table-column label="开通公共文件删除" prop="isdelect">
          <!-- scope.row 就是当前行的信息 -->
          <template slot-scope="scope">
            <el-switch v-model="scope.row.isdelect" @change="applyIsdelectChanged(scope.row)" active-color="red"></el-switch>
          </template>
        </el-table-column>


    <el-table-column
      fixed="right"
      label="控制台"
      width="100">
      <template slot-scope="scope">
       <el-tooltip effect="dark" content="删除" placement="top-start" :enterable="false" >
      <el-button type="danger" icon="el-icon-delete" size="mini" @click="deleteApply(scope.row.id)" class="butt1" style="width:25px"></el-button>
         </el-tooltip>
            <!-- 权限 -->
            <el-tooltip effect="dark" content="驳回" placement="top-start" :enterable="false" >
              <el-button type="warning" icon="el-icon-setting" style="width:25px"  size="mini"></el-button>
            </el-tooltip>
      </template>
    </el-table-column>
  </el-table>
      <!-- 分页 -->
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="queryInfo.pageNum"
        :page-sizes="[1, 2, 5, 100]"
        :page-size="queryInfo.pageSize"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total"
      ></el-pagination>
    </el-card>

    <!-- 创建新用户对话框 -->
    <el-dialog title="添加用户" :visible.sync="addDialogVisible" width="50%"
    @close="addDialogClosed">
      <!-- 内容主体区域 -->
      <el-form :model="addForm" :rules="addFormRules"
        ref="addFormRef" label-width="70px">
        <!-- 用户名 -->
        <el-form-item label="用户名" prop="username">
          <el-input v-model="addForm.username"></el-input>
        </el-form-item>
        <!-- 密码 -->
        <el-form-item label="密码" prop="password">
          <el-input v-model="addForm.password"></el-input>
        </el-form-item>
        <!-- 邮箱 -->
        <el-form-item label="邮箱" prop="email">
          <el-input v-model="addForm.email"></el-input>
        </el-form-item>
      </el-form>
      <!-- 内容底部区域 -->
      <span slot="footer" class="dialog-footer">
        <el-button @click="addDialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="addUser">确 定</el-button>
      </span>
    </el-dialog>
    <!-- 修改用户对话框 -->
    <el-dialog title="修改用户信息" :visible.sync="editDialogVisible" width="50%" @colse="editDialogClosed">
       <el-form :model="editForm" :rules="editFormRules" ref="editFormRef" label-width="70px">
        <!-- 用户名 -->
        <el-form-item label="用户名" prop="username">
          <el-input v-model="editForm.username" disabled></el-input>
        </el-form-item>
        <!-- 密码 -->
        <el-form-item label="密码" prop="password">
          <el-input v-model="editForm.password"></el-input>
        </el-form-item>
        <!-- 邮箱 -->
        <el-form-item label="邮箱" prop="email">
          <el-input v-model="editForm.email"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="editDialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="editUserInfo">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>
<script>
export default {
  data() {
    return {
      // 请求数据
      queryInfo: {
        query: "",
        pageNum: 1,
        pageSize: 5
      },
      userlist: [],// 用户列表
     
      total: 0, // 最大数据记录
      addDialogVisible: false ,// 对话框显示
      // 添加用户表单项
      addForm: {
        username:'',
        password:'',
        email:'',
      }, 
      // 控制修改用户对话框显示/隐藏
      editDialogVisible:false,
      // 修改用户信息
      editForm:{},
      // 验证规则
      addFormRules:{
        username:[
           { required: true, message: "请输入用户名", trigger: "blur" },
          { min: 5, max: 8, message: "长度在 5 到 8 个字符", trigger: "blur" }
        ],
        password:[
           { required: true, message: "请输入密码", trigger: "blur" },
          { min: 6, max: 8, message: "长度在 6 到 8 个字符", trigger: "blur" }
        ],
        email:[
           { required: true, message: "请输入邮箱", trigger: "blur" },
          { min: 5, max: 15, message: "请输入正确邮箱地址", trigger: "blur" }
        ],
      },
      // 修改用户表单验证规则
      editFormRules:{
          password:[
           { required: true, message: "请输入密码", trigger: "blur" },
           { min: 6, max: 8, message: "长度在 6 到 8 个字符", trigger: "blur" }
          ],
          email:[
           { required: true, message: "请输入邮箱", trigger: "blur" },
           { min: 5, max: 15, message: "请输入正确邮箱地址", trigger: "blur" }
          ],
      },
    };
  },
  created() {
    this.getUserList();
  },
  methods: {
    async getUserList() {
      // 调用post请求
      const { data: res } = await this.$http.get("allApply", {
        params: this.queryInfo
      });
      this.userlist = res.data; // 将返回数据赋值
      this.total = res.numbers; // 总个数
    },
    // 监听pageSize改变的事件
    handleSizeChange(newSize) {
      this.queryInfo.pageSize = newSize;
      this.getUserList(); // 数据发生改变重新申请数据
    },
    // 监听pageNum改变的事件
    handleCurrentChange(newPage) {
      this.queryInfo.pageNum = newPage;
      this.getUserList(); // 数据发生改变重新申请数据
    },
    // 修改用户vip状态
    async applyIsvipChanged(userinfo) {
      const { data: res } = await this.$http.put(
        `applyisvip?id=${userinfo.id}&isvip=${userinfo.isvip}&applymanname=${userinfo.applymanname}`
      );
      if (res != "success") {
        userinfo.isvip = !userinfo.isvip;
        return this.$message.error("vip权限审批失败！！！");
      }
      this.$message.success("vip权限审批成功！！！");
    },
     // 修改用户管理员权限状态
    async applyIsadminChanged(userinfo) {
      const { data: res } = await this.$http.put(
        `applyisadmin?id=${userinfo.id}&isadmin=${userinfo.isadmin}&applymanname=${userinfo.applymanname}`
      );
      if (res != "success") {
        userinfo.isadmin = !userinfo.isadmin;
        return this.$message.error("管理员权限审批失败！！！");
      }
      this.$message.success("管理员权限审批成功！！！");
    },

      // 修改用户管理员权限状态
    async applyIsdelectChanged(userinfo) {
      const { data: res } = await this.$http.put(
        `applyisdelect?id=${userinfo.id}&isdelect=${userinfo.isdelect}&applymanname=${userinfo.applymanname}`
      );
      if (res != "success") {
        userinfo.isdelect = !userinfo.isdelect;
        return this.$message.error("公共文件删除权限审批失败！！！");
      }
      this.$message.success("公共文件删除权限审批成功！！！");
    },


    // 监听添加用户
    addDialogClosed(){
      this.$refs.addFormRef.resetFields();// 重置表单项
    },
    // 添加用户
    addUser(){
        this.$refs.addFormRef.validate(async valid =>{
        console.log(valid);
        if( !valid ) return;
        // 发起请求
        const {data:res} = await this.$http.post("addAdmin",this.addForm);
        if (res != "success") {
        userinfo.state = !userinfo.state;
        return this.$message.error("添加管理员失败！！！");
        }
        this.$message.success("添加管理员操作成功！！！");
        //隐藏
        this.addDialogVisible = false;
        this.getUserList();
      })
    },
    // 展示修改框
    async showEditDialog(id){
       
        const {data:res} = await this.$http.get("getUpdate?id="+id);
        // if (res != "success") {
        // userinfo.state = !userinfo.state;
        // return this.$message.error("操作失败！！！");
        // }
        // this.$message.success("操作成功！！！");

        this.editForm = res;
        this.editDialogVisible = true;
    },
    // 关闭窗口
    editDialogClosed(){
      this.$refs.editFormRef.resetFields();
    },
    // 确认修改
    editUserInfo(){
      this.$refs.editFormRef.validate(async valid =>{
        console.log(valid);
        if( !valid ) return;
        // 发起请求
        const {data:res} = await this.$http.put("editUser",this.editForm);
        console.log(res);
         if (res != "success") return this.$message.error("操作失败！！！");
        this.$message.success("操作成功！！！");
        //隐藏
        this.editDialogVisible = false;
        this.getUserList();
      });
    },
    // 删除按钮
    async deleteApply(id){
      // 弹框
      const confirmResult = await this.$confirm('此操作将移除该用户审核, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).catch(err => err)
      // 成功删除为confirm 取消为 cancel
      if(confirmResult!='confirm'){
        return this.$message.info("已取消移除");
      }
      const {data:res} = await this.$http.delete("deleteApply?id="+id);
      if (res != "success") {
        return this.$message.error("移除失败！！！");
      }
      this.$message.success("移除成功！！！");
      this.getUserList();
    },
  }
};
</script>
<style lang="less" scoped>
</style>