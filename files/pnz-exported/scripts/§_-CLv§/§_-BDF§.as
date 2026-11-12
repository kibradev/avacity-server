package §_-CLv§
{
   public class §_-BDF§
   {
      private var §_-3zu§:Boolean;
      
      private var §_-26q§:String;
      
      private var _url:String;
      
      private var §_-1ik§:String;
      
      private var §_-4Xb§:Number;
      
      private var _userId:String;
      
      public function §_-BDF§(param1:Boolean, param2:String, param3:String, param4:String, param5:Number, param6:String)
      {
         super();
         this.§_-3zu§ = §_-3zt§.§_-7cy§(param1,"active") as Boolean;
         this.§_-26q§ = §_-3zt§.§_-7cy§(param2,"social") as String;
         this._url = §_-3zt§.§_-7cy§(param3,"url") as String;
         this.§_-1ik§ = §_-3zt§.§_-7cy§(param4,"project") as String;
         this._userId = §_-3zt§.§_-7cy§(param6,"userId") as String;
         this.§_-4Xb§ = param5;
      }
      
      public function get url() : String
      {
         return this._url;
      }
      
      public function get project() : String
      {
         return this.§_-1ik§;
      }
      
      public function get ttl() : Number
      {
         return this.§_-4Xb§;
      }
      
      public function get userId() : String
      {
         return this._userId;
      }
      
      public function get social() : String
      {
         return this.§_-26q§;
      }
      
      public function get active() : Boolean
      {
         return this.§_-3zu§;
      }
   }
}

