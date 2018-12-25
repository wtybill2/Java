var util = {
	SUCCESS : 0,
	ERROR : 1,
	NEED_LOGIN : 2,
	isNull : function(value){
		if(value == "" || value == undefined || value == null){
			return true;
		} else {
			return false;
		}
		
	},
	getSelectedIds : function(data){
		var idArray = []; //拿到数组[1,2,3]
		for(var i in data){
			idArray.push(data[i].id);
		}
		var ids = idArray.join(",");//"1,2,3"
		return ids;
	}
}
