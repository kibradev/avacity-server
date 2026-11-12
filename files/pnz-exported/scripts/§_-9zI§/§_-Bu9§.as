package §_-9zI§
{
   public class §_-Bu9§
   {
      private var §_-AH9§:String;
      
      private var _successCallback:Function;
      
      private var _errorCallback:Function;
      
      public function §_-Bu9§(param1:String, param2:Function, param3:Function = null)
      {
         super();
         this.§_-AH9§ = param1;
         this._successCallback = param2;
         this._errorCallback = param3;
      }
      
      public function get privilege() : String
      {
         return this.§_-AH9§;
      }
      
      public function get successCallback() : Function
      {
         return this._successCallback;
      }
      
      public function get errorCallback() : Function
      {
         return this._errorCallback;
      }
   }
}

