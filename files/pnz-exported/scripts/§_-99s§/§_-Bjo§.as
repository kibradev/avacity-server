package §_-99s§
{
   import §_-18o§.§_-ABX§;
   
   public class §_-Bjo§
   {
      public static const §_-yP§:String = "shopId";
      
      public static const §_-9Wz§:String = "selectionId";
      
      public static const §_-BnG§:String = "selectionLabel";
      
      private static const §_-9EA§:String = "id";
      
      private static const §_-5Fu§:String = "itmids";
      
      private var §_-AcP§:String;
      
      private var _label:String;
      
      private var §_-C5P§:Array;
      
      public function §_-Bjo§(param1:String, param2:String, param3:Array)
      {
         super();
         this.§_-AcP§ = param1;
         this._label = param2;
         this.§_-C5P§ = param3;
      }
      
      public function get id() : String
      {
         return this.§_-AcP§;
      }
      
      public function get localizedLabel() : String
      {
         return §_-ABX§.§_-631§(this._label);
      }
      
      public function get §_-3pC§() : Array
      {
         return this.§_-C5P§;
      }
   }
}

