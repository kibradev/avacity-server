package §_-6nL§
{
   import §_-0Fe§.§_-5el§;
   import §_-0HX§.§_-9Fi§;
   import §_-0uA§.§_-3YE§;
   
   public class §_-6O§
   {
      public static const §_-69J§:String = "appscentrum";
      
      public static const §_-AmZ§:String = "midroll";
      
      private static const §_-B76§:Array = [§_-69J§,§_-AmZ§];
      
      private var §_-3ET§:§_-3Zl§ = null;
      
      public function §_-6O§()
      {
         super();
      }
      
      public function init(param1:String) : void
      {
         if(!this.§_-6yS§(param1))
         {
            return;
         }
         if(param1 == §_-69J§)
         {
            this.§_-3ET§ = new §_-5el§();
         }
         else if(param1 == §_-AmZ§)
         {
            this.§_-3ET§ = new §_-9Fi§();
         }
         if(this.§_-3ET§ != null)
         {
            this.§_-3ET§.init();
         }
         else
         {
            §_-3YE§.§_-7aK§("Banner manager is not init");
         }
      }
      
      public function §_-4oB§() : void
      {
         if(this.§_-3ET§ == null)
         {
            return;
         }
         this.§_-3ET§.§_-4oB§(function():void
         {
            §_-3YE§.info("Banner started");
         },function():void
         {
            §_-3YE§.§_-7aK§("Cannot start banner");
         });
      }
      
      public function §_-3Bu§() : void
      {
         if(this.§_-3ET§ == null)
         {
            return;
         }
         this.§_-3ET§.§_-3Bu§(function():void
         {
            §_-3YE§.info("Banner hidden");
         },function():void
         {
            §_-3YE§.§_-7aK§("Cannot hide banner");
         });
      }
      
      public function §_-fz§(param1:Function) : void
      {
         var successCallback:Function = param1;
         if(this.§_-3ET§ == null)
         {
            return;
         }
         this.§_-3ET§.§_-4IC§(successCallback,function():void
         {
            §_-3YE§.§_-7aK§("Cannot show banner");
         });
      }
      
      private function §_-6yS§(param1:String) : Boolean
      {
         return §_-B76§.indexOf(param1) >= 0;
      }
   }
}

