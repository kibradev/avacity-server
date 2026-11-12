package §_-0Q-§
{
   import §_-1l5§.§_-4m-§;
   import §_-2U3§.ResourceManager;
   import §_-3eZ§.§_-BCG§;
   import §_-54O§.§_-ArM§;
   import §_-60f§.§_-547§;
   import §_-7Gj§.§_-24r§;
   import §_-AKx§.§_-0jI§;
   import §_-Bi2§.§_-1N5§;
   import §_-Bi2§.§_-Fs§;
   import §_-GM§.Context;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import penzville.Config;
   
   public class §_-9y2§ extends §_-QF§
   {
      public function §_-9y2§(param1:§_-4m-§, param2:int)
      {
         _offer = param1;
         §_-4WC§ = param2;
         var _loc3_:int = this.§_-26E§ != null && this.§_-26E§.dialogDescription != null ? int(this.§_-26E§.dialogDescription["width"]) : 300;
         var _loc4_:int = this.§_-26E§ != null && this.§_-26E§.dialogDescription != null ? int(this.§_-26E§.dialogDescription["height"]) : 400;
         super(param1,param2,_loc3_,_loc4_);
      }
      
      override protected function createSkin() : §_-Fs§
      {
         return new §_-1N5§();
      }
      
      override public function init() : void
      {
         var _loc1_:MovieClip = null;
         var _loc2_:§_-BCG§ = null;
         var _loc3_:§_-BCG§ = null;
         var _loc4_:§_-BCG§ = null;
         super.init();
         if(this.§_-26E§.§_-3e0§ > 0)
         {
            Context.§_-3gu§.§_-AO0§(offer.id,this.§_-26E§.stepId);
         }
         if(this.§_-26E§ == null)
         {
            close();
            return;
         }
         if(this.§_-26E§.dialogDescription != null)
         {
            _loc1_ = ResourceManager.createMovieClip(this.§_-26E§.dialogDescription["skin"]);
            addContentOverlay(_loc1_);
         }
         if(this.§_-26E§.§_-Bww§ != null)
         {
            _loc2_ = new §_-BCG§(ResourceManager.createMovieClip(this.§_-26E§.§_-Bww§["skin"]));
            _loc2_.x = this.§_-26E§.§_-Bww§["x"];
            _loc2_.y = this.§_-26E§.§_-Bww§["y"];
            _loc2_.modalResult = §_-0jI§.CLOSE;
            addContentOverlay(_loc2_);
         }
         if(this.§_-26E§.§_-9fH§ != null)
         {
            _loc3_ = new §_-BCG§(ResourceManager.createMovieClip(this.§_-26E§.§_-9fH§["skin"]));
            _loc3_.x = this.§_-26E§.§_-9fH§["x"];
            _loc3_.y = this.§_-26E§.§_-9fH§["y"];
            _loc3_.addEventListener(MouseEvent.CLICK,this.§_-Baz§);
            addContentOverlay(_loc3_);
         }
         if(this.§_-26E§.§_-9k4§ != null)
         {
            _loc4_ = new §_-BCG§(ResourceManager.createMovieClip(this.§_-26E§.§_-9k4§["skin"]));
            _loc4_.x = this.§_-26E§.§_-9k4§["x"];
            _loc4_.y = this.§_-26E§.§_-9k4§["y"];
            _loc4_.addEventListener(MouseEvent.CLICK,this.§_-AJw§);
            addContentOverlay(_loc4_);
         }
         if(offer.descriptor.statDescriptor != null)
         {
            offer.descriptor.statDescriptor.eventComplete("step_" + §_-0PN§ + "_show");
         }
      }
      
      private function §_-Baz§(param1:MouseEvent) : void
      {
         if(offer.descriptor.statDescriptor != null)
         {
            offer.descriptor.statDescriptor.eventComplete("step_" + §_-0PN§ + "_click");
         }
         modalResult = §_-0jI§.§_-9qy§;
         close();
      }
      
      private function §_-AJw§(param1:MouseEvent) : void
      {
         if(this.§_-26E§.§_-9k4§ == null && Boolean(this.§_-26E§.§_-9k4§.hasOwnProperty("link")) && this.§_-26E§.§_-9k4§["link"] != null)
         {
            return;
         }
         if(offer.descriptor.statDescriptor != null)
         {
            offer.descriptor.statDescriptor.eventComplete("step_" + §_-0PN§ + "_link");
         }
         if(!Config.disableExternalLinks)
         {
            navigateToURL(new URLRequest(this.§_-26E§.§_-9k4§["link"]),"_blank");
         }
      }
      
      private function get §_-26E§() : §_-547§
      {
         var _loc1_:§_-24r§ = offer.descriptor.getStep(§_-0PN§);
         if(_loc1_ == null)
         {
            return null;
         }
         return this.scenario != null ? this.scenario.§_-3I2§(String(_loc1_.order)) : null;
      }
      
      private function get scenario() : §_-ArM§
      {
         if(offer.descriptor == null)
         {
            return null;
         }
         return offer.descriptor.scenario as §_-ArM§;
      }
      
      public function get §_-RX§() : Boolean
      {
         if(this.§_-26E§ == null)
         {
            return false;
         }
         if(this.§_-26E§.§_-3e0§ == 0)
         {
            return true;
         }
         return Context.§_-3gu§.§_-4gc§(offer.id,this.§_-26E§.stepId,this.§_-26E§.§_-3e0§);
      }
   }
}

