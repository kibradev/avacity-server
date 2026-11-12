package §_-1pw§
{
   import §_-BeZ§.§_-0Yu§;
   import §_-BeZ§.§_-4Ww§;
   import §_-GM§.Context;
   import penzville.Application;
   
   public class §_-96H§ implements §_-0Yu§
   {
      private static const §_-ALD§:String = "flvs";
      
      private static const §_-CaY§:String = "brw";
      
      private static const §_-Bpy§:String = "brwvs";
      
      private static const §_-9wF§:String = "os";
      
      private static const §_-4uV§:String = "osvs";
      
      private static const §_-1iZ§:String = "scrs";
      
      private static const §_-2ck§:String = "ptt";
      
      private static const §_-BMW§:String = "et";
      
      private var §_-0mI§:String;
      
      private var §_-8Fx§:String;
      
      private var §_-0e1§:String;
      
      private var §_-9B3§:String;
      
      private var _osVersion:String;
      
      private var §_-681§:String;
      
      private var §_-6fX§:String;
      
      private var §_-4En§:String;
      
      public function §_-96H§()
      {
         super();
         this.configure();
      }
      
      public function get flashVersion() : String
      {
         return this.§_-0mI§;
      }
      
      public function set flashVersion(param1:String) : void
      {
         this.§_-0mI§ = param1;
      }
      
      public function get browser() : String
      {
         return this.§_-8Fx§;
      }
      
      public function set browser(param1:String) : void
      {
         this.§_-8Fx§ = param1;
      }
      
      public function get browserVersion() : String
      {
         return this.§_-0e1§;
      }
      
      public function set browserVersion(param1:String) : void
      {
         this.§_-0e1§ = param1;
      }
      
      public function get os() : String
      {
         return this.§_-9B3§;
      }
      
      public function set os(param1:String) : void
      {
         this.§_-9B3§ = param1;
      }
      
      public function get osVersion() : String
      {
         return this._osVersion;
      }
      
      public function set osVersion(param1:String) : void
      {
         this._osVersion = param1;
      }
      
      public function get screenResolution() : String
      {
         return this.§_-681§;
      }
      
      public function set screenResolution(param1:String) : void
      {
         this.§_-681§ = param1;
      }
      
      public function get §_-0BO§() : String
      {
         return this.§_-6fX§;
      }
      
      public function set §_-0BO§(param1:String) : void
      {
         this.§_-6fX§ = param1;
      }
      
      private function get §_-9NQ§() : String
      {
         return this.§_-4En§;
      }
      
      private function set §_-9NQ§(param1:String) : void
      {
         this.§_-4En§ = param1;
      }
      
      private function configure() : void
      {
         this.§_-0mI§ = Application.instance.§_-8to§("flashVersion",null);
         this.§_-8Fx§ = Application.instance.§_-8to§("browser",null);
         this.§_-0e1§ = Application.instance.§_-8to§("browserVersion",null);
         this.§_-681§ = Application.instance.§_-8to§("screenResolution",null);
         this.§_-4En§ = Context.instance.§_-AIA§.§_-3OB§ ? "js" : "as";
         var _loc1_:String = Application.instance.§_-8to§("os",null);
         if(_loc1_ != null)
         {
            this.§_-9B3§ = _loc1_.split(":")[0];
            this._osVersion = _loc1_.split(":")[1];
         }
         this.§_-6fX§ = this.§_-0fs§();
      }
      
      private function §_-0fs§() : String
      {
         if(Application.instance.§_-8to§("is_play_machine",0) == 1)
         {
            return "VKPlayMachine";
         }
         return null;
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
         param1.putString(§_-ALD§,this.flashVersion);
         param1.putString(§_-CaY§,this.browser);
         param1.putString(§_-Bpy§,this.browserVersion);
         param1.putString(§_-9wF§,this.os);
         param1.putString(§_-4uV§,this.osVersion);
         param1.putString(§_-1iZ§,this.screenResolution);
         param1.putString(§_-2ck§,this.§_-0BO§);
         param1.putString(§_-BMW§,this.§_-9NQ§);
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this.flashVersion = param1.getString(§_-ALD§);
         this.browser = param1.getString(§_-CaY§);
         this.browserVersion = param1.getString(§_-Bpy§);
         this.os = param1.getString(§_-9wF§);
         this.osVersion = param1.getString(§_-4uV§);
         this.screenResolution = param1.getString(§_-1iZ§);
         this.§_-0BO§ = param1.getString(§_-2ck§);
         this.§_-9NQ§ = param1.getString(§_-BMW§);
      }
   }
}

