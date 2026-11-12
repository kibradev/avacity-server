package §_-C6z§
{
   import §_-0Au§.§_-4gY§;
   import §_-0TK§.§_-CdV§;
   import §_-0tK§.§_-9Mn§;
   import §_-2qd§.§_-9ai§;
   import §_-45i§.§_-4We§;
   import §_-4eY§.§_-4aG§;
   import §_-4eY§.§_-8pe§;
   import §_-5NF§.§_-2j6§;
   import §_-6-L§.§_-6aF§;
   import §_-6Km§.§_-00§;
   import §_-6Km§.§_-3q§;
   import §_-6Km§.§_-6-3§;
   import §_-6Km§.§_-Az-§;
   import §_-7KP§.§_-9Sw§;
   import §_-7np§.ConsoleService;
   import §_-8Gk§.§_-AdL§;
   import §_-A2M§.§_-4Ba§;
   import §_-AFi§.§_-4jt§;
   import §_-AKx§.§_-GN§;
   import §_-BeZ§.§_-4Ww§;
   import §_-GM§.Context;
   import flash.display.MovieClip;
   import penzville.Application;
   
   public class §_-5qw§ extends §_-7za§ implements §_-4jt§
   {
      private static const §_-61A§:String = "questDescriptors";
      
      private static const §_-0jR§:String = "gnqst";
      
      private static const §_-BAe§:String = ".quest";
      
      private var §_-9AC§:§_-Az-§;
      
      private var §_-BGX§:Function;
      
      private var §_-1UP§:Function;
      
      private var §_-7kE§:Array = [];
      
      private var _questInfo:§_-2j6§ = null;
      
      private var _netManager:§_-6ah§;
      
      public function §_-5qw§(param1:Class, param2:Function, param3:Function)
      {
         this.§_-9AC§ = new param1() as §_-Az-§;
         this.§_-1UP§ = param2;
         this.§_-BGX§ = param3;
         super(§_-61A§,§_-CdV§);
      }
      
      override public function init() : void
      {
         super.init();
         §_-6kq§.addEventListener(§_-9Mn§.§_-45D§,this.§_-2r5§);
         this._netManager = §_-6kq§.getComponent(§_-6ah§);
         this._netManager.§_-1-t§(§_-0jR§,this.§_-6cA§);
      }
      
      override public function run() : void
      {
         ConsoleService.instance.§_-BoJ§.§_-7di§(new §_-AdL§(§_-6kq§.id));
      }
      
      public function §_-App§() : §_-4Ba§
      {
         var task:§_-4Ba§ = null;
         var onQuestsChanged:Function = null;
         var currentQuest:§_-CdV§ = this.getCurrentQuestDescriptor();
         if(currentQuest != null)
         {
            return §_-4Ba§.resolve();
         }
         task = new §_-4Ba§();
         onQuestsChanged = function(param1:§_-4gY§):void
         {
            Application.instance.removeEventListener(§_-4gY§.§_-4Rk§,onQuestsChanged);
            task.resolve();
         };
         Application.instance.addEventListener(§_-4gY§.§_-4Rk§,onQuestsChanged);
         Context.§_-2Vf§.§_-7oF§();
         return task;
      }
      
      public function getNewQuest() : void
      {
         this._netManager.§_-6NO§(§_-0jR§,new §_-4Ww§());
      }
      
      public function getCurrentQuestDescriptor(param1:String = "automatic") : §_-CdV§
      {
         var _loc2_:String = null;
         var _loc3_:§_-CdV§ = null;
         if(this._questInfo == null)
         {
            return null;
         }
         for(_loc2_ in this._questInfo.§_-5Yv§)
         {
            if(this._questInfo.§_-5Yv§[_loc2_] > Context.cityPlayer.currentServerTime)
            {
               _loc3_ = this.§_-MX§(_loc2_);
               if(_loc3_ != null && _loc3_.kind == param1)
               {
                  return _loc3_;
               }
            }
         }
         return null;
      }
      
      public function §_-MX§(param1:String) : §_-CdV§
      {
         var _loc2_:§_-CdV§ = null;
         for each(_loc2_ in this.§_-7kE§)
         {
            if(_loc2_.questId == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function get §_-ASX§() : Boolean
      {
         if(this._questInfo == null)
         {
            return true;
         }
         var _loc1_:int = int(this.§_-7kE§.length);
         var _loc2_:int = int(§_-6aF§.§_-vN§(this._questInfo.§_-5Yv§));
         return _loc2_ < _loc1_;
      }
      
      public function §_-8Uk§(param1:String) : Boolean
      {
         var _loc4_:§_-CdV§ = null;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         if(this._questInfo == null)
         {
            return true;
         }
         var _loc2_:int = 0;
         var _loc3_:Array = [];
         for each(_loc4_ in this.§_-7kE§)
         {
            if(_loc4_.kind == param1)
            {
               _loc3_.push(_loc4_.questId);
               _loc2_++;
            }
         }
         _loc5_ = 0;
         for each(_loc6_ in this._questInfo)
         {
            if(_loc3_.indexOf(_loc6_) >= 0)
            {
               _loc5_++;
            }
         }
         return _loc5_ < _loc2_;
      }
      
      public function getCurrentQuestsByType(param1:int = 0) : Array
      {
         var questCollection:§_-6-3§;
         var type:int = param1;
         if(!§_-6kq§.isActive() || this._questInfo == null)
         {
            return [];
         }
         questCollection = Context.cityPlayer.questCollection;
         return questCollection.currentQuests.filter(function(param1:§_-00§, param2:int, param3:Array):Boolean
         {
            return isModuleQuest(param1.questId) && !_questInfo.isExpiredQuest(param1.questId);
         });
      }
      
      public function getQuestIconPath(param1:String = null) : String
      {
         var _loc2_:§_-CdV§ = this.getModuleQuestDescriptor(param1) as §_-CdV§;
         if(_loc2_ == null)
         {
            return "";
         }
         return §_-8pe§.§_-1-J§(§_-8pe§.EVENT);
      }
      
      public function isModuleQuest(param1:String) : Boolean
      {
         if(!§_-6kq§.isActive())
         {
            return false;
         }
         return this.§_-MX§(param1) != null;
      }
      
      public function §_-5gy§() : Boolean
      {
         var _loc1_:String = null;
         if(this._questInfo == null)
         {
            return false;
         }
         for(_loc1_ in this._questInfo.§_-5Yv§)
         {
            if(this._questInfo.§_-5Yv§[_loc1_] > Context.cityPlayer.currentServerTime)
            {
               return false;
            }
         }
         return true;
      }
      
      public function getModuleQuestDescriptor(param1:String) : §_-4aG§
      {
         return this.§_-MX§(param1);
      }
      
      public function §_-0Du§(param1:String, param2:String) : MovieClip
      {
         return this.§_-BGX§(param1,param2);
      }
      
      public function §_-l2§(param1:§_-00§) : §_-GN§
      {
         return this.§_-1UP§(param1);
      }
      
      public function createTask(param1:String) : §_-3q§
      {
         return this.§_-9AC§.createTask(param1);
      }
      
      public function §_-7UP§(param1:String) : String
      {
         return null;
      }
      
      public function getQuestEndTime(param1:String) : int
      {
         if(this._questInfo == null || !this._questInfo.§_-5Yv§.hasOwnProperty(param1))
         {
            return -1;
         }
         return this._questInfo.§_-5Yv§[param1];
      }
      
      public function get questEndLockTime() : int
      {
         return this._questInfo != null ? this._questInfo.questEndLockTime : 0;
      }
      
      public function getCompletedQuestsCountByKind(param1:String) : int
      {
         if(this._questInfo == null)
         {
            return 0;
         }
         return this._questInfo.getCompletedQuestsCountByKind(param1);
      }
      
      override protected function onDescriptorReceive(param1:Array) : void
      {
         this.§_-7kE§ = param1;
      }
      
      private function §_-2r5§(param1:§_-9Mn§) : void
      {
         var _loc2_:§_-9Sw§ = param1.info;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:§_-2j6§ = _loc2_.§_-7Ni§(§_-2j6§.§_-zf§) as §_-2j6§;
         if(_loc3_ == null)
         {
            return;
         }
         this._questInfo = _loc3_;
      }
      
      private function §_-6cA§(param1:§_-9ai§) : void
      {
         var _loc2_:String = null;
         var _loc3_:§_-CdV§ = this.getCurrentQuestDescriptor(§_-CdV§.§_-2Dh§);
         if(_loc3_ != null)
         {
            _loc2_ = _loc3_.questId;
         }
         new §_-4We§(null,_loc2_).showModal();
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         if(§_-6kq§ != null)
         {
            §_-6kq§.removeEventListener(§_-9Mn§.§_-45D§,this.§_-2r5§);
            ConsoleService.instance.§_-BoJ§.§_-24I§(§_-6kq§.id + §_-BAe§);
         }
         super.destroy();
      }
   }
}

