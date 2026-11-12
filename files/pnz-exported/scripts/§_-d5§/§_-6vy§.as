package §_-d5§
{
   import §_-6-L§.§_-3hw§;
   
   public class §_-6vy§
   {
      private var §_-AcP§:String = null;
      
      private var §_-930§:Boolean = false;
      
      private var §_-8MS§:Boolean = false;
      
      private var §_-573§:Boolean = false;
      
      private var §_-CH1§:Boolean = false;
      
      private var §_-Ye§:Boolean = false;
      
      private var §_-5gA§:Boolean = false;
      
      private var §_-18B§:Array;
      
      private var §_-7Y7§:int;
      
      private var §_-CGK§:String;
      
      private var §_-Bsu§:Boolean;
      
      private var §_-0mA§:String;
      
      public function §_-6vy§()
      {
         super();
      }
      
      public function configure(param1:XML) : void
      {
         var _loc2_:String = null;
         this.§_-AcP§ = §_-3hw§.getString(param1,"@id");
         this.§_-7Y7§ = §_-3hw§.getInt(param1,"@energyPrice");
         this.§_-CGK§ = §_-3hw§.getString(param1,"@location");
         this.§_-0mA§ = §_-3hw§.getString(param1,"@participateModuleCheck");
         this.§_-Bsu§ = §_-3hw§.getBoolean(param1,"@confirmRequired");
         this.§_-930§ = §_-3hw§.getBoolean(param1,"disablePanels");
         if(this.§_-930§)
         {
            _loc2_ = §_-3hw§.getString(param1,"disablePanels.@panels");
            if(_loc2_ != null)
            {
               this.§_-18B§ = _loc2_.split(",");
            }
         }
         this.§_-8MS§ = §_-3hw§.getBoolean(param1,"disableWorld");
         this.§_-573§ = §_-3hw§.getBoolean(param1,"disableMouse");
         this.§_-CH1§ = §_-3hw§.getBoolean(param1,"disableAvatars");
         this.§_-Ye§ = §_-3hw§.getBoolean(param1,"hideAvatars");
         this.§_-5gA§ = §_-3hw§.getBoolean(param1,"disconnectWorld");
      }
      
      public function get id() : String
      {
         return this.§_-AcP§;
      }
      
      public function get disablePanels() : Boolean
      {
         return this.§_-930§;
      }
      
      public function get disableWorld() : Boolean
      {
         return this.§_-8MS§;
      }
      
      public function get disableMouse() : Boolean
      {
         return this.§_-573§;
      }
      
      public function get disableAvatars() : Boolean
      {
         return this.§_-CH1§;
      }
      
      public function get hideAvatars() : Boolean
      {
         return this.§_-Ye§;
      }
      
      public function get disconnectWorld() : Boolean
      {
         return this.§_-5gA§;
      }
      
      public function get §_-CDJ§() : Array
      {
         return this.§_-18B§;
      }
      
      public function get §_-6gV§() : int
      {
         return this.§_-7Y7§;
      }
      
      public function get location() : String
      {
         return this.§_-CGK§;
      }
      
      public function get §_-ND§() : Boolean
      {
         return this.§_-Bsu§;
      }
      
      public function get §_-2iG§() : String
      {
         return this.§_-0mA§;
      }
   }
}

