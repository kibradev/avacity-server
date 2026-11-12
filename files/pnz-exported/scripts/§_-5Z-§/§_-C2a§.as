package §_-5Z-§
{
   import §_-0uA§.§_-3YE§;
   import §_-7Mq§.§_-3rG§;
   import §_-7Mq§.§_-nG§;
   import §_-A2M§.§_-4Ba§;
   import §_-d5§.§_-2CX§;
   import §_-d5§.§_-6vy§;
   
   public class §_-C2a§
   {
      private var §_-6Mr§:Object = {};
      
      public function §_-C2a§()
      {
         super();
      }
      
      public function configure(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:String = null;
         var _loc4_:§_-82F§ = null;
         if(param1 == null)
         {
            return;
         }
         for each(_loc2_ in param1.elements("game"))
         {
            _loc3_ = _loc2_["@id"];
            _loc4_ = §_-9SE§.§_-0HB§(_loc3_);
            if(_loc4_ == null)
            {
               §_-3YE§.§_-7aK§("Unknown game with id " + _loc3_);
               return;
            }
            _loc4_.configure(_loc2_);
            this.§_-4of§(_loc3_,_loc4_);
         }
      }
      
      public function §_-Ae§(param1:String) : §_-6vy§
      {
         return this.getGame(param1).§_-A7m§;
      }
      
      public function createGameModel(param1:String) : §_-3rG§
      {
         return this.getGame(param1).createGameModel();
      }
      
      public function createGamerModel(param1:String) : §_-nG§
      {
         return this.getGame(param1).createGamerModel();
      }
      
      public function createPlayground(param1:§_-3rG§, param2:§_-Ahc§) : §_-76E§
      {
         return this.getGame(param1.type).createPlayground(param1,param2);
      }
      
      public function §_-2sf§(param1:String) : Boolean
      {
         if(!this.§_-6Mr§.hasOwnProperty(param1))
         {
            return false;
         }
         return this.getGame(param1).§_-A7m§.§_-ND§;
      }
      
      public function §_-63L§(param1:String) : §_-2CX§
      {
         return this.getGame(param1).gameDescriptor;
      }
      
      public function §_-9t2§(param1:String) : int
      {
         return this.§_-Ae§(param1).§_-6gV§;
      }
      
      public function checkStart(param1:String) : §_-4Ba§
      {
         return this.getGame(param1).checkStart();
      }
      
      public function showStartDialog(param1:String) : void
      {
         this.getGame(param1).showStartDialog();
      }
      
      public function getGame(param1:String) : §_-82F§
      {
         if(!this.§_-6Mr§.hasOwnProperty(param1))
         {
            throw new Error("Unknown game with id " + param1);
         }
         return this.§_-6Mr§[param1];
      }
      
      public function canBeDisplayedInLocationsDialog(param1:String, param2:Object) : §_-4Ba§
      {
         return this.getGame(param1).canBeDisplayedInLocationsDialog(param2);
      }
      
      public function §_-B9W§(param1:String) : Boolean
      {
         return this.§_-6Mr§.hasOwnProperty(param1);
      }
      
      public function beforeMoveToLocation(param1:String) : §_-4Ba§
      {
         return this.getGame(param1).beforeMoveToLocation();
      }
      
      public function §_-4of§(param1:String, param2:§_-82F§) : void
      {
         this.§_-6Mr§[param1] = param2;
         param2.init();
      }
      
      public function §_-1JT§(param1:String) : void
      {
         if(this.§_-B9W§(param1))
         {
            this.getGame(param1).destroy();
            delete this.§_-6Mr§[param1];
         }
      }
      
      public function §_-Bbj§(param1:Class) : Array
      {
         var _loc3_:String = null;
         var _loc4_:§_-82F§ = null;
         var _loc2_:Array = [];
         for(_loc3_ in this.§_-6Mr§)
         {
            _loc4_ = this.§_-6Mr§[_loc3_];
            if(_loc4_ != null && _loc4_ is param1)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
   }
}

