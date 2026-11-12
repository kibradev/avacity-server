package §_-0TK§
{
   import §_-3VF§.§_-0nG§;
   import §_-3VF§.§_-6G§;
   import §_-AFi§.§_-6lZ§;
   import §_-BeZ§.§_-1AH§;
   import §_-BeZ§.§_-4Ww§;
   
   public class §_-0Nb§ implements §_-1AH§
   {
      public function §_-0Nb§()
      {
         super();
      }
      
      public function §_-3xF§(param1:§_-4Ww§) : Object
      {
         var _loc2_:String = param1.getString(§_-B6z§.MODULE_ID);
         if(_loc2_ == null)
         {
            throw new Error("moduleId is null");
         }
         var _loc3_:§_-6G§ = §_-0nG§.instance.getModule(_loc2_);
         if(_loc3_ == null)
         {
            throw new Error("module is null");
         }
         if(!(_loc3_ is §_-6lZ§))
         {
            throw new Error("module is not ICityModuleInfoForViewer");
         }
         var _loc4_:Class = §_-6lZ§(_loc3_).§_-4d7§();
         if(_loc4_ == null)
         {
            throw new Error("moduleInfoForViewerClass is null");
         }
         var _loc5_:§_-B6z§ = new _loc4_() as §_-B6z§;
         if(_loc5_ == null)
         {
            throw new Error("moduleInfoForViewer is null");
         }
         _loc5_.fromAGSObject(param1);
         return _loc5_;
      }
   }
}

