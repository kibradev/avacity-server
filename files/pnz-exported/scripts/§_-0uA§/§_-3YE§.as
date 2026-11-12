package §_-0uA§
{
   public class §_-3YE§
   {
      private static var _instance:§_-3YE§;
      
      public static const §_-3D5§:uint = 0;
      
      public static const §_-B9X§:uint = 1;
      
      public static const §_-7ag§:uint = 2;
      
      public static const §_-65F§:uint = 3;
      
      public static const §_-9YL§:uint = 4;
      
      private var §_-4Zl§:uint = 0;
      
      private var §_-A-G§:Array = [];
      
      public function §_-3YE§()
      {
         super();
         this.§_-A-G§.push(new §_-65h§());
      }
      
      public static function get instance() : §_-3YE§
      {
         if(_instance == null)
         {
            _instance = new §_-3YE§();
         }
         return _instance;
      }
      
      public static function log(param1:Object, param2:uint = 3, param3:String = "") : void
      {
         instance.§_-A9q§(param1,param2,param3);
      }
      
      public static function info(param1:Object, param2:String = "") : void
      {
         instance.§_-A9q§(param1,§_-3D5§,param2);
      }
      
      public static function error(param1:Object, param2:String = "") : void
      {
         instance.§_-A9q§(param1,§_-65F§,param2);
      }
      
      public static function §_-7aK§(param1:Object, param2:String = "") : void
      {
         instance.§_-A9q§(param1,§_-7ag§,param2);
      }
      
      public static function §_-ANW§(param1:Object, param2:String = "") : void
      {
         instance.§_-A9q§(param1,§_-9YL§,param2);
      }
      
      public function §_-9XE§(param1:§_-COU§) : void
      {
         this.§_-A-G§.push(param1);
      }
      
      public function §_-8bB§() : void
      {
         this.§_-A-G§ = [];
      }
      
      protected function write(param1:String, param2:uint, param3:String) : void
      {
         var _loc4_:§_-COU§ = null;
         for each(_loc4_ in this.§_-A-G§)
         {
            _loc4_.write(param1,param2,param3);
         }
      }
      
      public function set §_-5Kw§(param1:uint) : void
      {
         /*
          * 