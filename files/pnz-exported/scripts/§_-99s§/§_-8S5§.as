package §_-99s§
{
   import §_-2U3§.ResourceManager;
   import §_-9NP§.§_-9Iq§;
   import §_-AaA§.§_-5Kl§;
   import §_-BeZ§.§_-4Ww§;
   import §_-MZ§.§_-82Q§;
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public class §_-8S5§ extends §_-7Tj§
   {
      private static const §_-2ZO§:String = "mdf";
      
      public static const §_-AyZ§:String = "energy";
      
      private var §_-AEe§:Object = {};
      
      public function §_-8S5§()
      {
         super();
      }
      
      override public function loadXML(param1:XML) : void
      {
         var _loc2_:XML = null;
         super.loadXML(param1);
         if(param1.hasOwnProperty("modifyers"))
         {
            for each(_loc2_ in (param1.elements("modifyers")[0] as XML).elements("modifyer"))
            {
               this.§_-AEe§[_loc2_["@name"]] = parseFloat(_loc2_["@effect"]);
            }
         }
      }
      
      public function getEffect(param1:String) : *
      {
         return !!this.§_-AEe§.hasOwnProperty(param1) ? this.§_-AEe§[param1] : null;
      }
      
      override public function createIcon() : MovieClip
      {
         var _loc1_:MovieClip = ResourceManager.hasDefinition(iconClass) ? ResourceManager.createMovieClip(iconClass) : new MovieClip();
         if(this.getEffect(§_-82Q§.§_-B8§) != null)
         {
            _loc1_ = this.§_-6oU§(_loc1_,this);
         }
         return _loc1_;
      }
      
      public function §_-6oU§(param1:MovieClip, param2:§_-7Tj§) : MovieClip
      {
         var _loc3_:MovieClip = null;
         if(param1 == null || param2 == null)
         {
            return null;
         }
         if(param2 is §_-8S5§)
         {
            _loc3_ = param1.getChildByName("count") as MovieClip;
            _loc3_.addChild(this.§_-6mI§(param2 as §_-8S5§,§_-82Q§.§_-B8§));
         }
         return param1;
      }
      
      private function §_-6mI§(param1:§_-8S5§, param2:String) : TextField
      {
         var _loc3_:int = param1.getEffect(param2) as int;
         if(_loc3_ > 0)
         {
            return §_-5Kl§.createTextField(0,0,_loc3_.toString(),§_-5Kl§.§_-0iQ§,§_-9Iq§.getStyle(param1.typeId));
         }
         return new TextField();
      }
      
      override public function fromAGSObject(param1:§_-4Ww§) : void
      {
         super.fromAGSObject(param1);
         this.§_-AEe§ = param1.getMap(§_-2ZO§,int);
      }
   }
}

