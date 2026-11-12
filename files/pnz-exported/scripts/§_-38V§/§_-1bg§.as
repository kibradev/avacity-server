package §_-38V§
{
   import §_-7xl§.§_-5m-§;
   import flash.display.MovieClip;
   
   public class §_-1bg§ extends §_-5m-§ implements §_-ga§
   {
      private static const §_-0gf§:int = 1000;
      
      private var §_-7JI§:int;
      
      private var §_-2US§:int;
      
      private var §_-0nz§:Boolean;
      
      private var §_-AL9§:String = "";
      
      private var §_-GZ§:Boolean = true;
      
      private var _time:int = 0;
      
      private var §_-4Bg§:Boolean = false;
      
      private var §_-CE-§:Object;
      
      private var §_-00y§:int = 1000;
      
      private var §_-7dw§:int = -1;
      
      public function §_-1bg§(param1:Object, param2:Boolean = true)
      {
         super();
         if(!param1 is MovieClip || !param1 is §_-3Dp§)
         {
            throw new Error("Animatable object must be instance of MovieClip or IAnimatableSequence");
         }
         this.§_-CE-§ = param1;
         this.§_-GZ§ = param2;
         this.updateAnimation();
         if(this.§_-CE-§ is MovieClip)
         {
            MovieClip(this.§_-CE-§).stop();
         }
      }
      
      override public function destroy() : void
      {
         this.§_-CE-§ = null;
         super.destroy();
      }
      
      private function updateAnimation(param1:§_-69x§ = null) : void
      {
         if(param1 == null)
         {
            this.§_-7JI§ = 1;
            this.§_-2US§ = this.totalFrames;
            this.§_-0nz§ = this.§_-GZ§;
            this.§_-AL9§ = null;
         }
         else
         {
            this.§_-7JI§ = param1.start;
            this.§_-2US§ = param1.length;
            this.§_-0nz§ = param1.loop;
            this.§_-AL9§ = param1.name;
         }
         this.currentFrame = this.§_-7JI§;
      }
      
      public function play(param1:§_-69x§ = null) : void
      {
         this.updateAnimation(param1);
         this.§_-4Bg§ = true;
      }
      
      public function stop() : void
      {
         this.§_-4Bg§ = false;
      }
      
      private function §_-BHq§() : void
      {
         if(this.currentFrame < this.§_-7JI§)
         {
            this.currentFrame = this.§_-7JI§;
         }
         if(this.currentFrame > this.§_-7JI§ + this.§_-2US§)
         {
            if(this.§_-0nz§)
            {
               this._time = (this._time - this.§_-7JI§ * §_-0gf§) % ((this.§_-2US§ + 1) * §_-0gf§) + this.§_-7JI§ * §_-0gf§;
            }
            else
            {
               this.currentFrame = this.§_-7JI§ + this.§_-2US§;
               this.§_-4Bg§ = false;
            }
         }
      }
      
      protected function §_-88D§() : void
      {
         if(this.§_-CE-§ is MovieClip && this.§_-7dw§ != this.currentFrame)
         {
            this.§_-7dw§ = this.currentFrame;
            MovieClip(this.§_-CE-§).gotoAndStop(this.currentFrame);
         }
         else if(this.§_-CE-§ is §_-3Dp§)
         {
            §_-3Dp§(this.§_-CE-§).gotoFrame(this.currentFrame);
         }
      }
      
      public function tick() : void
      {
         if(this.§_-4Bg§)
         {
            this._time += this.§_-00y§;
            this.§_-BHq§();
            this.§_-88D§();
         }
      }
      
      public function get currentAnimation() : String
      {
         return this.§_-AL9§;
      }
      
      public function get currentFrame() : uint
      {
         return int(this._time / §_-0gf§);
      }
      
      public function set currentFrame(param1:uint) : void
      {
         this._time = param1 * §_-0gf§;
         this.§_-BHq§();
      }
      
      public function get totalFrames() : uint
      {
         return this.§_-CE-§ is MovieClip ? uint(MovieClip(this.§_-CE-§).totalFrames) : uint(§_-3Dp§(this.§_-CE-§).totalFrames);
      }
      
      public function get §_-Bko§() : Boolean
      {
         return this.§_-4Bg§;
      }
      
      public function get speed() : Number
      {
         return this.§_-00y§ / §_-0gf§;
      }
      
      public function set speed(param1:Number) : void
      {
         this.§_-00y§ = Math.round(param1 * §_-0gf§);
      }
      
      public function get duration() : Number
      {
         return this.§_-2US§ * §_-0gf§ / this.§_-00y§;
      }
      
      public function set duration(param1:Number) : void
      {
         this.§_-00y§ = Math.round(this.§_-2US§ * §_-0gf§ / param1);
      }
   }
}

