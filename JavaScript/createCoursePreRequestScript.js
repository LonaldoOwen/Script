// 设置目录信息
// [{"catalogId":"{{CATALOG_ID}}","mode":"1","pattern":"1","planName":"课时1","teacherId":"{{SELECT_TEACHER_ID}}","day":"{{DAY}}","hourStart":"{{START_HOUR}}","muniteStart":"{{START_MINUTE}}","hourEnd":"{{END_HOUR}}","mumiteEnd":"{{END_MINUTE}}"}]

// 功能：实现对date string日期增、减
// @dateString: 日期字符串，格式：“yyyy-MM-dd”;
// @days: 偏移天数;
// return: 新日期字符串，格式：“yyyy-MM-dd”
function addDate(dateString, days) {
    var date=new Date(dateString);
    date.setDate(date.getDate()+days);

    var month=date.getMonth()+1;
    var day = date.getDate();

    if(month<10){
        month = "0"+month;
    }

    if(day<10){
        day = "0"+day;
    }

    var newDateString = date.getFullYear()+"-"+month+"-"+day;
    return newDateString;

}




// 获取第一个目录日期
var firstDateString = pm.environment.get("DAY");
var teacherId = pm.environment.get("SELECT_TEACHER_ID");
var start_hour = pm.environment.get("START_HOUR");
var start_minute = pm.environment.get("START_MINUTE");
var end_hour = pm.environment.get("END_HOUR");
var end_minute = pm.environment.get("END_MINUTE");


// 设置JSON
// 定义JSON格式变量
var planinfosObject = [
    {
        "catalogId":"77753",
        "mode":"1",
        "pattern":"1",
        "planName":"课时1",
        "teacherId":"teacherId",
        "day":addDate(firstDateString, 1),
        "hourStart":"start_hour",
        "muniteStart":"start_minute",
        "hourEnd":"end_hour",
        "mumiteEnd":"end_minute"
    }
];
// JSON格式化，直接用变量不行
// js通过 JSON.stringify()格式化字符串；通过JSON.parse()解析JSON对象
planinfosObject = JSON.stringify(planinfosObject);
console.log("###########planinfosObject:" + planinfosObject);

// 应该用个for循环来创建
var catologCount = pm.environment.get("CATOLOG_COUNT");
// 1、定义一个JOSN空数组
var catologs = new Array();
// 2、通过for循环增加object
for (int i; i<catologCount; i++) {
    var object = [
        {
            "catalogId":"77753",
            "mode":"1",
            "pattern":"1",
            "planName":"课时1",
            "teacherId":"teacherId",
            "day":addDate(firstDateString, 1),
            "hourStart":"start_hour",
            "muniteStart":"start_minute",
            "hourEnd":"end_hour",
            "mumiteEnd":"end_minute"
        }
    ];
    catologs[i] = object;
}



// 清理环境变量
pm.environment.unset("planinfos_object");

// 设置环境变量"planinfos_object"
pm.environment.set("planinfos_object", planinfosObject);    


// 创建课程：一个目录
function createCourseWithOneCatolog() {
    
}

// 创建课程：多个目录
function createCourseWithMultipleCatolog() {
    
}

// 根据数量创建（）
function createCourseWithCatologs(numbers) {
    
}




