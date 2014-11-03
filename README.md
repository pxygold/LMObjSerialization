#LMObjSerialization

##API用法
*通过类名来创建一个属性数组
	+ (NSArray *)attributeArrayWithClass:(Class)Obj;
*从文件中解析对象的时候调用
	+ (void)encodeWithCoder:(NSCoder *)encoder obj:(NSObject *)obj;
*将对象写入文件的时候调用
	+ (void)decodeWithCoder:(NSCoder *)decoder obj:(NSObject *)obj;		
*把各属性编码成NSString
	+ (NSString *)descriptionWithObj:(NSObject *)obj;