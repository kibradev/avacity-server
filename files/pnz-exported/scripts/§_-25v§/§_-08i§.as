package §_-25v§
{
   public class §_-08i§
   {
      private var _url:String;
      
      private var §_-1ik§:String;
      
      private var §_-3zu§:Boolean = false;
      
      public function §_-08i§(param1:String, param2:String, param3:Boolean = false)
      {
         super();
         this._url = param1;
         this.§_-1ik§ = param2;
         this.§_-3zu§ = param3;
      }
      
      public function get url() : String
      {
         return this._url;
      }
      
      public function get project() : String
      {
         return this.§_-1ik§;
      }
      
      public function get active() : Boolean
      {
         return this.§_-3zu§;
      }
   }
}

