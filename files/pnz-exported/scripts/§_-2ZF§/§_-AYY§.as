package §_-2ZF§
{
   import §_-2U3§.ResourceManager;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class §_-AYY§
   {
      protected var §_-2an§:String;
      
      protected var §_-0MP§:Object = {};
      
      protected var §_-8zq§:String;
      
      protected var §_-7gH§:String;
      
      protected var §_-33E§:String;
      
      protected var _icon:String;
      
      public function §_-AYY§(param1:String, param2:String)
      {
         super();
         this.§_-33E§ = param2;
         this.§_-2an§ = param1;
         this.§_-0MP§ = this.§_-Yl§;
      }
      
      public function createIcon() : DisplayObject
      {
         if(this._icon != null && this._icon != "")
         {
            return ResourceManager.createMovieClip(this._icon);
         }
         return new Sprite();
      }
      
      public function §_-3xS§(param1:String, param2:String) : void
      {
         this.§_-0MP§[param1] = param2;
      }
      
      public function get §_-Yl§() : Object
      {
         return this.§_-0MP§;
      }
      
      public function get classAlias() : String
      {
         return this.§_-33E§;
      }
      
      public function get §_-8oy§() : String
      {
         return this.§_-2an§;
      }
      
      public function get category() : String
      {
         return this.§_-8zq§;
      }
      
      public function set category(param1:String) : void
      {
         this.§_-8zq§ = param1;
      }
      
      public function get icon() : String
      {
         return this._icon;
      }
      
      public function set icon(param1:String) : void
      {
         this._icon = param1;
      }
   }
}

