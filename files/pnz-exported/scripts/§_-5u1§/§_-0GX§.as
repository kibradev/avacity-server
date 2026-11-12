package §_-5u1§
{
   import §_-0uA§.§_-3YE§;
   import flash.media.Sound;
   
   public class §_-0GX§
   {
      private var §_-sH§:Object = {};
      
      private var _currentTrack:§_-5gj§ = null;
      
      private var §_-BxP§:§_-5gj§ = null;
      
      private var §_-b4§:Number = 1;
      
      private var §_-34B§:Boolean = false;
      
      private var _paused:Number = 0;
      
      private var §_-7oe§:Boolean = false;
      
      public function §_-0GX§()
      {
         super();
      }
      
      public function §_-DN§(param1:String, param2:String, param3:Number = 10) : void
      {
         this.§_-sH§[param1] = new §_-5gj§(param1,this,param2,param3);
      }
      
      public function §_-6E8§(param1:String, param2:Sound, param3:Number = 10) : void
      {
         this.§_-sH§[param1] = new §_-5gj§(param1,this,param2,param3);
      }
      
      public function §_-S4§() : void
      {
         this.§_-34B§ = true;
         if(this._currentTrack != null)
         {
            this._currentTrack.§_-S4§();
            this.§_-7oe§ = false;
         }
      }
      
      public function §_-4oy§() : void
      {
         this.§_-34B§ = false;
         if(this._currentTrack != null)
         {
            this._currentTrack.§_-4oy§();
            this.§_-7oe§ = true;
         }
      }
      
      public function §_-2rW§() : void
      {
         ++this._paused;
         if(this._currentTrack != null)
         {
            this._currentTrack.§_-S4§();
         }
      }
      
      public function §_-2dy§() : void
      {
         if(this._paused > 0)
         {
            --this._paused;
         }
         if(this._paused == 0)
         {
            if(this._currentTrack != null && !this.§_-34B§)
            {
               this._currentTrack.§_-4oy§();
            }
         }
      }
      
      public function §_-BFu§() : Boolean
      {
         return this._paused > 0;
      }
      
      public function play(param1:String, param2:Boolean = true, param3:Boolean = false) : void
      {
         if(!this.§_-sH§.hasOwnProperty(param1))
         {
            §_-3YE§.error("Invalid track id=" + param1);
            return;
         }
         if(this._currentTrack != null)
         {
            if(this._currentTrack.id == param1 && !param3)
            {
               return;
            }
            this._currentTrack.stop(param2);
         }
         var _loc4_:§_-5gj§ = this.getTrack(param1);
         this.§_-BxP§ = this._currentTrack;
         this._currentTrack = _loc4_;
         this._currentTrack.volume = this.§_-b4§;
         if(this.§_-34B§ || this.§_-BFu§())
         {
            this._currentTrack.§_-S4§();
         }
         else
         {
            this._currentTrack.§_-4oy§();
         }
         this._currentTrack.play();
      }
      
      public function §_-4V§(param1:String, param2:Function, param3:Boolean = true, param4:Boolean = false) : void
      {
         if(!this.§_-sH§.hasOwnProperty(param1))
         {
            §_-3YE§.error("Invalid track id=" + param1);
            return;
         }
         if(this._currentTrack != null)
         {
            if(this._currentTrack.id == param1 && !param4)
            {
               return;
            }
            this._currentTrack.stop(param3);
         }
         var _loc5_:§_-5gj§ = this.getTrack(param1);
         this.§_-BxP§ = this._currentTrack;
         this._currentTrack = _loc5_;
         this._currentTrack.volume = this.§_-b4§;
         if(this.§_-34B§ || this.§_-BFu§())
         {
            this._currentTrack.§_-S4§();
         }
         else
         {
            this._currentTrack.§_-4oy§();
         }
         this._currentTrack.§_-4V§(param2);
      }
      
      public function stop(param1:Boolean = true) : void
      {
         if(this._currentTrack != null)
         {
            this._currentTrack.stop(param1);
            this.§_-7oe§ = false;
         }
      }
      
      public function getTrack(param1:String) : §_-5gj§
      {
         return this.§_-sH§[param1];
      }
      
      public function get volume() : Number
      {
         return this.§_-b4§;
      }
      
      public function set volume(param1:Number) : void
      {
         this.§_-b4§ = param1;
         if(this._currentTrack != null)
         {
            this._currentTrack.volume = param1;
         }
      }
      
      public function get §_-68x§() : §_-5gj§
      {
         return this._currentTrack;
      }
      
      public function get isPlaying() : Boolean
      {
         return this.§_-7oe§;
      }
   }
}

