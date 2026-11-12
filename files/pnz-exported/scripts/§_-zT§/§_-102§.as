package §_-zT§
{
   import §_-7xl§.§_-7VJ§;
   import §_-8cq§.§_-dB§;
   import flash.display.MovieClip;
   
   public class §_-102§
   {
      private var §_-7WX§:§_-dB§;
      
      private var §_-9QZ§:Array = [];
      
      private var §_-9nJ§:int = -1;
      
      private var §_-0c5§:int = 0;
      
      private var §_-2e4§:int = 0;
      
      private var §_-BxC§:int = 0;
      
      private var §_-5VA§:Function;
      
      public function §_-102§(param1:§_-dB§)
      {
         super();
         this.§_-7WX§ = param1;
      }
      
      public function add(param1:§_-CIF§) : void
      {
         this.§_-9QZ§.push(param1);
      }
      
      public function get rawFile() : §_-dB§
      {
         return this.§_-7WX§;
      }
      
      public function getNames(param1:String = null) : Array
      {
         var _loc3_:§_-CIF§ = null;
         var _loc2_:Array = [];
         for each(_loc3_ in this.§_-9QZ§)
         {
            if(param1 == null || _loc3_.name.indexOf(param1) >= 0)
            {
               _loc2_.push(_loc3_.name);
            }
         }
         return _loc2_;
      }
      
      public function §_-42G§(param1:String) : §_-CIF§
      {
         var _loc2_:§_-CIF§ = null;
         for each(_loc2_ in this.§_-9QZ§)
         {
            if(_loc2_.name == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function §_-BPT§(param1:String, param2:Class) : *
      {
         var _loc4_:* = undefined;
         var _loc3_:§_-CIF§ = this.§_-42G§(param1);
         if(_loc3_)
         {
            _loc4_ = _loc3_.content as param2;
            if(_loc4_ != null)
            {
               return _loc4_;
            }
         }
         return null;
      }
      
      public function §_-1as§() : String
      {
         if(this.§_-7WX§["getMD5"] is Function)
         {
            return Function(this.§_-7WX§["getMD5"]).call();
         }
         return null;
      }
      
      public function getADF(param1:String) : §_-7VJ§
      {
         return this.§_-BPT§(param1,§_-7VJ§);
      }
      
      public function getMovieClip(param1:String) : MovieClip
      {
         return this.§_-BPT§(param1,MovieClip);
      }
      
      public function §_-9QW§(param1:String) : XML
      {
         return this.§_-BPT§(param1,XML);
      }
      
      public function §_-9AJ§(param1:Function) : void
      {
         this.§_-2e4§ = 0;
         this.§_-9nJ§ = 0;
         this.§_-0c5§ = -1;
         this.§_-BxC§ = this.§_-9QZ§.length;
         this.§_-5VA§ = param1;
         this.§_-6od§();
      }
      
      private function §_-6od§() : Boolean
      {
         ++this.§_-0c5§;
         if(this.§_-0c5§ >= this.§_-BxC§)
         {
            this.§_-5VA§(this);
            return false;
         }
         var _loc1_:§_-CIF§ = this.§_-9QZ§[this.§_-0c5§];
         _loc1_.convert(null,this.§_-858§,this.§_-2sl§);
         return true;
      }
      
      private function §_-858§(param1:§_-CIF§) : void
      {
         ++this.§_-9nJ§;
         this.§_-6od§();
      }
      
      private function §_-2sl§(param1:§_-CIF§) : void
      {
         ++this.§_-9nJ§;
         ++this.§_-2e4§;
         this.§_-6od§();
      }
   }
}

