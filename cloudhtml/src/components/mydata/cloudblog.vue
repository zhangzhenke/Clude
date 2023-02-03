<template>
       <!-- 面包屑导航 -->
     <div class="test2" style="width:1300px;height:625px;background-color: rgb(177, 198, 223);">
          <el-breadcrumb separator-class="el-icon-arrow-right">
               <el-breadcrumb-item :to="{ path: '/home' }">首页</el-breadcrumb-item>
               <el-breadcrumb-item>数据监控</el-breadcrumb-item>
               <el-breadcrumb-item>云盘内存</el-breadcrumb-item>
             </el-breadcrumb>
         <div id="myChart" style="width:700px;height:500px;float:left;margin-left: 240px"></div>
     </div>
     
   </template>
   <script>
     import * as echarts from 'echarts'
     export default {
       name: 'test2',
       data () {
         return {
         queryInfo: {
         query: "",
         pageNum: 1,
         pageSize: 2,
       },
       queryInfof: {
         query: "",
         pageNum: 1,
         pageSize: 100,
       },
           myChart: '',
           opinionData2: [
     

           ]
         }
       },
       mounted: function () {
          this.drawLine1();

       },
       created() {
         this.getdateList();
      },
       methods: {
          async  drawLine1 () {
              // 调用post请求
      const { data: res } = await this.$http.get("allclouddate", {
        params: this.queryInfo
      });
      if (res.flag != "success") {
        return this.$message.error("该数据获取失败！！！");
      }

      console.log(res.flag)
       this.opinionData2 = res.opinionData2; // 将返回数据赋值
           this.myChart = echarts.init(document.getElementById('myChart'))
           this.myChart.setOption({
             title: {
               text: '云盘内存使用情况', // 主标题
               subtext: '', // 副标题
               x: 'left' // x轴方向对齐方式
             },
             grid: { containLabel: true },
             tooltip: {
               trigger: 'item',
               formatter: '{a} <br/>{b} : {d}%'
             },
             // color: ['#1FC48D', '#F5A60A', '#6DC8EC', '#3F8FFF'],
             color: ['#1FC48D', '#6DC8EC'],
             // backgroundColor: '#ffffff',
             legend: {
               orient: 'vertical',
               icon: 'circle',
               align: 'left',
               x: 'right',
               y: 'bottom',
               data: ['已用流量', '剩余流量']
             },
             series: [
               {
                 name: '流量情况',
                 type: 'pie',
                 radius: ['50%', '70%'],
                 avoidLabelOverlap: false,
                 center: ['40%', '50%'],
                 itemStyle: {
                   emphasis: {
                     shadowBlur: 10,
                     shadowOffsetX: 0,
                     shadowColor: 'rgba(0, 0, 0, 0.5)'
                   },
                   color: function (params) {
                     // 自定义颜色
                     var colorList = ['#1FC48D', '#6DC8EC']
                     return colorList[params.dataIndex]
                   }
                 },
                 data: this.opinionData2
               }
             ]
           })
         },
         async getdateList() {
      // 调用post请求
      const { data: res } = await this.$http.get("getcloudupdata", {
        params: this.queryInfof
      });
      if (res != "success") {
        return this.$message.error("该数据获取失败！！！");
      }
      console.log(res)
        },
       }
     }
     </script>
     