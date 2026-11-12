package §_-7Mq§
{
   import §_-6-L§.§_-49j§;
   import §_-BeZ§.§_-0Yu§;
   import §_-BeZ§.§_-1e5§;
   import §_-BeZ§.§_-4Ww§;
   import §_-GM§.Context;
   import §_-d5§.§_-6vy§;
   
   public class §_-3rG§ implements §_-0Yu§
   {
      private static const §_-1qn§:String = "game";
      
      public static const §_-6Ud§:String = "lgid";
      
      public static const §_-6BE§:String = "lgcid";
      
      public static const §_-1J7§:String = "lgoid";
      
      public static const §_-3su§:String = "lgtp";
      
      public static const §_-9BS§:String = "lgmrs";
      
      private var §_-AcP§:String = null;
      
      private var §_-8ZX§:String = null;
      
      private var §_-74I§:String = null;
      
      private var _type:String = null;
      
      protected var _gamers:Object = {};
      
      public function §_-3rG§()
      {
         super();
      }
      
      public function get id() : String
      {
         return this.§_-AcP§;
      }
      
      public function set id(param1:String) : void
      {
         this.§_-AcP§ = param1;
      }
      
      public function get creatorId() : String
      {
         return this.§_-8ZX§;
      }
      
      public function set creatorId(param1:String) : void
      {
         this.§_-8ZX§ = param1;
      }
      
      public function get opponentId() : String
      {
         return this.§_-74I§;
      }
      
      public function set opponentId(param1:String) : void
      {
         this.§_-74I§ = param1;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      public function get gamers() : Object
      {
         return this._gamers;
      }
      
      public function §_-4zu§(param1:String) : Boolean
      {
         return this._gamers.hasOwnProperty(param1);
      }
      
      public function getGamer(param1:String) : §_-nG§
      {
         return !!this._gamers.hasOwnProperty(param1) ? this._gamers[param1] : null;
      }
      
      public function §_-9Ct§(param1:§_-nG§) : void
      {
         this._gamers[param1.userId] = param1;
      }
      
      public function §_-5Hf§(param1:String) : void
      {
         if(this.§_-4zu§(param1))
         {
            delete this._gamers[param1];
         }
      }
      
      public function get serverRoomId() : String
      {
         return §_-1qn§ + "_" + this.type + "_" + this.id;
      }
      
      public function §_-07J§(param1:String) : Boolean
      {
         var _loc2_:§_-nG§ = null;
         for each(_loc2_ in this._gamers)
         {
            if(_loc2_.userId == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function get configuration() : §_-6vy§
      {
         return Context.§_-5Q-§.§_-Ae§(this._type);
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
         param1.put(§_-6Ud§,this.id);
         param1.put(§_-6BE§,this.creatorId);
         param1.put(§_-1J7§,this.opponentId);
         param1.put(§_-3su§,this.type);
         param1.§_-3f6§(§_-9BS§,§_-49j§.§_-FR§(this._gamers));
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         var _loc4_:§_-4Ww§ = null;
         var _loc5_:§_-nG§ = null;
         this.id = param1.getString(§_-6Ud§);
         this.creatorId = param1.getString(§_-6BE§);
         this.opponentId = param1.getString(§_-1J7§);
         this.type = param1.getString(§_-3su§);
         this._gamers = {};
         var _loc2_:§_-1e5§ = param1.§_-CUA§(§_-9BS§);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = _loc2_.§_-ANw§(_loc3_);
            _loc5_ = Context.§_-5Q-§.createGamerModel(this._type);
            if(_loc5_ != null)
            {
               _loc5_.fromAGSObject(_loc4_);
               this._gamers[_loc5_.userId] = _loc5_;
            }
            _loc3_++;
         }
      }
      
      public function §_-AoK§(param1:String) : Boolean
      {
         return this._gamers.hasOwnProperty(param1);
      }
   }
}

