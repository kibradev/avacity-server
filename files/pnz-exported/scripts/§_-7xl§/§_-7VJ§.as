package §_-7xl§
{
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.media.Sound;
   import flash.system.ApplicationDomain;
   import flash.utils.getDefinitionByName;
   
   public class §_-7VJ§
   {
      private var §_-mg§:ApplicationDomain;
      
      private var §_-0rA§:String;
      
      public function §_-7VJ§(param1:ApplicationDomain, param2:String = "undefined")
      {
         super();
         this.§_-mg§ = param1;
         this.§_-0rA§ = param2;
      }
      
      public static function get §_-2tM§() : §_-7VJ§
      {
         return new §_-7VJ§(ApplicationDomain.currentDomain,"current");
      }
      
      public function createBitmapData(param1:String, param2:int, param3:int) : BitmapData
      {
         var _loc4_:Class = this.getDefinition(param1) as Class;
         return new _loc4_(param2,param3) as BitmapData;
      }
      
      private function §_-6kc§(param1:String, param2:Class) : *
      {
         var _loc3_:Class = this.getDefinition(param1);
         return new _loc3_() as param2;
      }
      
      public function hasDefinition(param1:String) : Boolean
      {
         return this.§_-mg§ != null ? this.§_-mg§.hasDefinition(param1) : Boolean(getDefinitionByName(param1) != null);
      }
      
      public function getDefinition(param1:String) : Class
      {
         if(this.§_-mg§ == null)
         {
            return getDefinitionByName(param1) as Class;
         }
         if(!this.§_-mg§.hasDefinition(param1) || !this.§_-mg§.getDefinition(param1) is Class)
         {
            throw new §_-73b§("Class definition " + param1 + " not exists, domain=" + this.§_-0rA§);
         }
         return this.§_-mg§.getDefinition(param1) as Class;
      }
      
      public function createMovieClip(param1:String) : MovieClip
      {
         return this.§_-6kc§(param1,MovieClip);
      }
      
      public function createSound(param1:String) : Sound
      {
         return this.§_-6kc§(param1,Sound);
      }
      
      public function createSprite(param1:String) : Sprite
      {
         return this.§_-6kc§(param1,Sprite);
      }
      
      public function createClass(param1:String) : Class
      {
         return this.§_-6kc§(param1,Class);
      }
      
      public function get §_-6jQ§() : String
      {
         return this.§_-0rA§;
      }
   }
}

