function arrayContains(arr, val){
	for (var i = 0; i < array_length(arr); i++) {
		if (arr[i] == val) return i;
	}
	return -1;
}