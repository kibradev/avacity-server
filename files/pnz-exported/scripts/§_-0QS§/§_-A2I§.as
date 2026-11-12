package §_-0QS§
{
   import §_-0uA§.§_-3YE§;
   import §_-18o§.§_-5LJ§;
   import §_-9Bv§.§_-8fL§;
   import §_-GM§.Context;
   
   public class §_-A2I§
   {
      private var §_-6zh§:int = 0;
      
      private var §_-2g0§:int = 16777215;
      
      private var §_-Ahe§:String = "";
      
      private var _url:String;
      
      private var §_-6lY§:Boolean = false;
      
      private var §_-1Yj§:Boolean = false;
      
      private var §_-5Sl§:Object = {};
      
      public function §_-A2I§()
      {
         super();
      }
      
      public function configure(param1:§_-8fL§) : void
      {
         var hints:Array = null;
         var params:§_-8fL§ = null;
         var currentPageConfig:§_-8fL§ = null;
         var hintList:§_-8fL§ = null;
         var locale:String = null;
         var regexp:RegExp = null;
         var config:§_-8fL§ = param1;
         try
         {
            hints = config.getList("textHints");
            if(hints != null)
            {
               for each(hintList in hints)
               {
                  if(hintList != null)
                  {
                     locale = hintList.getString("locale");
                     this.§_-5Sl§[locale] = hintList.getList("hint");
                  }
               }
            }
            params = §_-5LJ§.§_-9-U§(config.getList("params"));
            currentPageConfig = this.§_-C0§(params);
            this.§_-6zh§ = currentPageConfig.getInt("bgColor",1711426);
            this.§_-2g0§ = currentPageConfig.getInt("textColor",16777215);
            this.§_-6lY§ = currentPageConfig.getBoolean("stretchLogo",false);
            this.§_-1Yj§ = currentPageConfig.getBoolean("fillScreen",false);
            this._url = currentPageConfig.getString("url");
            if(Context.instance.§_-AIA§.§_-3OB§)
            {
               regexp = new RegExp("([./]?)swf([/]?)","g");
               this._url = this._url.replace(regexp,"$1abz$2");
            }
         }
         catch(e:Error)
         {
            §_-3YE§.§_-ANW§("Cannot load preloader descriptor");
            throw e;
         }
      }
      
      public function §_-mj§(param1:String) : Array
      {
         if(!this.§_-5Sl§.hasOwnProperty(param1))
         {
            return [];
         }
         return this.§_-5Sl§[param1];
      }
      
      public function get url() : String
      {
         return this._url;
      }
      
      public function get bgColor() : int
      {
         return this.§_-6zh§;
      }
      
      public function get textColor() : int
      {
         return this.§_-2g0§;
      }
      
      public function get §_-CSl§() : String
      {
         return this.§_-Ahe§;
      }
      
      public function get stretchLogo() : Boolean
      {
         return this.§_-6lY§;
      }
      
      public function get fillScreen() : Boolean
      {
         return this.§_-1Yj§;
      }
      
      private function §_-C0§(param1:§_-8fL§) : §_-8fL§
      {
         if(!param1.§_-3vm§("page"))
         {
            this.§_-Ahe§ = "";
            return param1;
         }
         var _loc2_:§_-8fL§ = §_-5LJ§.§_-9-U§(param1.getList("page"));
         this.§_-Ahe§ = _loc2_.getString("value");
         return _loc2_;
      }
   }
}

