package §_-Btg§
{
   import §_-1Fx§.§_-5n7§;
   import §_-6-L§.DisplayUtils;
   import §_-7ps§.§_-AND§;
   import §_-7xl§.§_-8Ks§;
   import §_-8KL§.§_-3-M§;
   import §_-Bef§.§_-0rS§;
   import §_-Bef§.§_-26s§;
   import §_-Bef§.§_-47g§;
   import §_-Bef§.§_-4GE§;
   import §_-Bef§.§_-62b§;
   import §_-Bef§.§_-7Px§;
   import §_-Hy§.TutorialHelpActor;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import penzville.Config;
   
   public class §_-8jl§
   {
      private static var _instance:§_-8jl§;
      
      public static const §_-ue§:uint = 0;
      
      public static const §_-C-Z§:uint = 1;
      
      public static const §_-3aO§:uint = 2;
      
      public static const §_-6rq§:uint = 3;
      
      public static const §_-7eO§:uint = 4;
      
      public static const §_-6aU§:uint = 5;
      
      public static const §_-jX§:uint = 6;
      
      public static const §_-6LH§:uint = 7;
      
      private var §_-7rN§:Sprite = null;
      
      private var §_-34M§:§_-5n7§ = null;
      
      private var §_-4wC§:Array = [];
      
      private var §_-9ng§:TutorialHelpActor = null;
      
      public function §_-8jl§()
      {
         super();
      }
      
      public static function get instance() : §_-8jl§
      {
         if(_instance == null)
         {
            _instance = new §_-8jl§();
         }
         return _instance;
      }
      
      public static function get §_-Do§() : §_-1s0§
      {
         if(§_-1s0§.instance.isTutorial())
         {
            return §_-1s0§.instance;
         }
         return §_-1s0§.instance;
      }
      
      private function §_-8m4§() : Sprite
      {
         var _loc1_:Sprite = new Sprite();
         _loc1_.graphics.lineStyle(0,0,0);
         _loc1_.graphics.beginFill(0,0);
         _loc1_.graphics.drawRect(0,0,Config.§_-50z§,Config.§_-6Z0§);
         _loc1_.graphics.endFill();
         return _loc1_;
      }
      
      public function §_-1Yk§(param1:Vector.<§_-AND§>, param2:Boolean = true) : void
      {
         this.§_-5CD§();
         this.§_-B7Y§(param1);
         if(param2 && this.§_-4wC§.length > 0)
         {
            if(this.§_-7rN§ == null)
            {
               this.§_-7rN§ = this.§_-8m4§();
               this.§_-34M§.addChild(this.§_-7rN§);
               this.§_-7rN§.addEventListener(MouseEvent.CLICK,this.§_-9y-§);
            }
            this.§_-7rN§.visible = true;
            DisplayUtils.§_-36C§(this.§_-7rN§);
         }
      }
      
      private function §_-5CD§() : void
      {
         var _loc1_:Object = null;
         var _loc2_:uint = this.§_-4wC§.length;
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = this.§_-4wC§.pop();
            if(_loc1_ is DisplayObject)
            {
               this.§_-34M§.removeChild(_loc1_ as DisplayObject);
            }
            if(_loc1_ is §_-8Ks§)
            {
               §_-8Ks§(_loc1_).destroy();
            }
            _loc1_ = null;
            _loc3_++;
         }
      }
      
      private function §_-B7Y§(param1:Vector.<§_-AND§>) : void
      {
         var _loc3_:§_-AND§ = null;
         var _loc4_:Class = null;
         var _loc2_:Object = null;
         for each(_loc3_ in param1)
         {
            if(_loc3_.type == §_-7eO§)
            {
               if(this.§_-9ng§ != null)
               {
                  this.§_-9ng§.§_-7bu§(_loc3_.getGenderTitle(this.§_-9ng§.sex));
               }
            }
            else
            {
               _loc4_ = this.§_-V6§(_loc3_.type);
               _loc2_ = new _loc4_(_loc3_);
               if(_loc2_ is DisplayObject)
               {
                  this.§_-34M§.addChild(_loc2_ as DisplayObject);
               }
               this.§_-4wC§.push(_loc2_);
            }
         }
      }
      
      private function §_-V6§(param1:uint) : Class
      {
         switch(param1)
         {
            case §_-C-Z§:
               return §_-0rS§;
            case §_-ue§:
               return §_-62b§;
            case §_-3aO§:
               return §_-4GE§;
            case §_-6rq§:
               return §_-26s§;
            case §_-jX§:
               return §_-7Px§;
            case §_-6LH§:
               return §_-3-M§;
            case §_-6aU§:
               return §_-47g§;
            default:
               return §_-62b§;
         }
      }
      
      public function §_-BQ3§() : void
      {
         if(this.§_-7rN§ != null)
         {
            this.§_-7rN§.visible = false;
         }
         this.§_-5CD§();
      }
      
      public function §_-1Oe§() : void
      {
         var _loc1_:uint = 0;
         while(_loc1_ < this.§_-4wC§.length)
         {
            if(this.§_-4wC§[_loc1_] is DisplayObject)
            {
               (this.§_-4wC§[_loc1_] as DisplayObject).visible = false;
            }
            _loc1_++;
         }
      }
      
      public function §_-3qz§() : void
      {
         var _loc1_:uint = 0;
         while(_loc1_ < this.§_-4wC§.length)
         {
            if(this.§_-4wC§[_loc1_] is DisplayObject)
            {
               (this.§_-4wC§[_loc1_] as DisplayObject).visible = true;
            }
            _loc1_++;
         }
      }
      
      private function §_-9y-§(param1:MouseEvent) : void
      {
         this.§_-BQ3§();
      }
      
      public function set container(param1:§_-5n7§) : void
      {
         this.§_-34M§ = param1;
      }
      
      public function set npc(param1:TutorialHelpActor) : void
      {
         this.§_-9ng§ = param1;
      }
   }
}

