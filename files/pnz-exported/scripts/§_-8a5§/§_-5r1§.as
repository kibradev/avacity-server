package §_-8a5§
{
   public class §_-5r1§
   {
      private var value:*;
      
      private var §_-6hX§:§_-CSb§;
      
      private var token:§_-Aqv§;
      
      public function §_-5r1§(param1:String)
      {
         super();
         this.§_-6hX§ = new §_-CSb§(param1);
         this.§_-2WX§();
         this.value = this.§_-y-§();
      }
      
      public function getValue() : *
      {
         return this.value;
      }
      
      private function §_-2WX§() : §_-Aqv§
      {
         return this.token = this.§_-6hX§.§_-0tl§();
      }
      
      private function §_-2Ke§() : Array
      {
         var _loc1_:Array = new Array();
         this.§_-2WX§();
         if(this.token.type == §_-6Uu§.§_-86Z§)
         {
            return _loc1_;
         }
         while(true)
         {
            _loc1_.push(this.§_-y-§());
            this.§_-2WX§();
            if(this.token.type == §_-6Uu§.§_-86Z§)
            {
               break;
            }
            if(this.token.type == §_-6Uu§.§_-7Sb§)
            {
               this.§_-2WX§();
            }
            else
            {
               this.§_-6hX§.§_-21J§("Expecting ] or , but found " + this.token.value);
            }
         }
         return _loc1_;
      }
      
      private function §_-9Ar§() : Object
      {
         var _loc2_:String = null;
         var _loc1_:Object = new Object();
         this.§_-2WX§();
         if(this.token.type == §_-6Uu§.§_-0bd§)
         {
            return _loc1_;
         }
         while(true)
         {
            if(this.token.type == §_-6Uu§.§_-BZk§)
            {
               _loc2_ = String(this.token.value);
               this.§_-2WX§();
               if(this.token.type == §_-6Uu§.§_-6Ip§)
               {
                  this.§_-2WX§();
                  _loc1_[_loc2_] = this.§_-y-§();
                  this.§_-2WX§();
                  if(this.token.type == §_-6Uu§.§_-0bd§)
                  {
                     break;
                  }
                  if(this.token.type == §_-6Uu§.§_-7Sb§)
                  {
                     this.§_-2WX§();
                  }
                  else
                  {
                     this.§_-6hX§.§_-21J§("Expecting } or , but found " + this.token.value);
                  }
               }
               else
               {
                  this.§_-6hX§.§_-21J§("Expecting : but found " + this.token.value);
               }
            }
            else
            {
               this.§_-6hX§.§_-21J§("Expecting string but found " + this.token.value);
            }
         }
         return _loc1_;
      }
      
      private function §_-y-§() : Object
      {
         if(this.token == null)
         {
            this.§_-6hX§.§_-21J§("Unexpected end of input");
         }
         switch(this.token.type)
         {
            case §_-6Uu§.§_-18A§:
               return this.§_-9Ar§();
            case §_-6Uu§.§_-487§:
               return this.§_-2Ke§();
            case §_-6Uu§.§_-BZk§:
            case §_-6Uu§.§_-0hg§:
            case §_-6Uu§.§_-1TR§:
            case §_-6Uu§.§_-0Az§:
            case §_-6Uu§.§_-8-V§:
               return this.token.value;
            default:
               this.§_-6hX§.§_-21J§("Unexpected " + this.token.value);
               return null;
         }
      }
   }
}

