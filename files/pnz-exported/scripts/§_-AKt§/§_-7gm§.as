package §_-AKt§
{
   import flash.system.Capabilities;
   import mx.utils.Platform;
   
   public class §_-7gm§
   {
      private var _isMobile:Boolean;
      
      private var _isMac:Boolean;
      
      private var §_-2yw§:Boolean;
      
      private var §_-CA8§:Boolean;
      
      public function §_-7gm§()
      {
         super();
         this._isMobile = Platform.isMobile;
         this._isMac = Capabilities.os.toLowerCase().search("mac os") >= 0;
         this.§_-2yw§ = false;
         this.§_-CA8§ = false;
      }
      
      public function get isMobile() : Boolean
      {
         return this._isMobile;
      }
      
      public function get isMac() : Boolean
      {
         return this._isMac;
      }
      
      public function get §_-3OB§() : Boolean
      {
         return this.§_-2yw§;
      }
      
      public function get §_-07h§() : Boolean
      {
         return this.§_-CA8§;
      }
   }
}

