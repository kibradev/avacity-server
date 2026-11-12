package §_-0kB§
{
   import ags.§_-5x-§;
   
   public class §_-4H0§
   {
      private var §_-AQJ§:Array = [];
      
      private var _components:Array = [];
      
      public function §_-4H0§()
      {
         super();
      }
      
      public function §_-BF3§(param1:Class) : void
      {
         if(this.§_-0rO§(param1))
         {
            throw new §_-4Vl§("Component already added! " + param1);
         }
         var _loc2_:Object = new param1();
         if(!_loc2_ is §_-4w1§)
         {
            throw new §_-4Vl§("Invalid component class: " + param1);
         }
         (_loc2_ as §_-4w1§).init(this);
         this._components.push(_loc2_);
         this.§_-AQJ§.push(param1);
      }
      
      public function §_-0rO§(param1:Class) : Boolean
      {
         return this.§_-AQJ§.indexOf(param1) >= 0;
      }
      
      public function getComponent(param1:Class) : *
      {
         var _loc2_:int = int(this.§_-AQJ§.indexOf(param1));
         if(_loc2_ < 0)
         {
            return null;
         }
         return this._components[_loc2_];
      }
      
      public function set netClient(param1:§_-5x-§) : void
      {
         var _loc2_:§_-4w1§ = null;
         for each(_loc2_ in this._components)
         {
            _loc2_.netClient = param1;
         }
      }
   }
}

