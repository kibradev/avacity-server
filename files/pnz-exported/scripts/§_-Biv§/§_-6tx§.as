package §_-Biv§
{
   import §_-6-L§.§_-6aF§;
   import §_-BeZ§.§_-4Ww§;
   import §_-ti§.§_-2Xl§;
   import §_-ti§.§_-4dj§;
   import §_-ti§.§_-7E1§;
   
   public class §_-6tx§ extends §_-3iK§
   {
      private static const §_-1FS§:Object = {
         "0":"throwCake",
         "1":"canyonRace",
         "2":"beachRace",
         "3":"snowSlope",
         "4":"meerkat",
         "5":"pillow",
         "6":"dance",
         "7":"joke",
         "8":"makeup",
         "9":"photo",
         "10":"skiRink",
         "11":"kissHug"
      };
      
      public function §_-6tx§()
      {
         super("challenge_start");
      }
      
      override protected function createDescriptor() : §_-7E1§
      {
         var _loc1_:§_-7E1§ = new §_-7E1§(§_-C6H§,"Start club challenge",§_-C6H§ + " -type [challenge_type] -startTime [datetime] -finishTime [datetime]","admin",[]);
         _loc1_.§_-AqZ§(§_-C6H§ + " -type meerkat -startTime \"2024-01-15 10:00\" -finishTime \"2024-01-15 18:00\"","Запуск челленжа \'Бросание торта\' с 10:00 до 18:00");
         _loc1_.§_-AqZ§(§_-C6H§ + " -type joke -startTime \"2024-01-20 09:00\" -finishTime \"2024-01-21 23:59\"","Запуск длительного челленжа на выходных");
         _loc1_.§_-AqZ§(§_-C6H§ + " -type kissHug -startTime \"2024-01-18 19:00\" -finishTime \"2024-01-18 22:00\"","Вечерний челленж на 3 часа");
         _loc1_.§_-1V§([new §_-2Xl§("type","Club challenge type (выбирается из списка доступных типов)",§_-4dj§.§_-1Pz§).setRequired(true).setPossibleValues(this.§_-2uO§()),new §_-2Xl§("startTime","Start challenge time (форматы: YYYY-MM-DD HH:MM, YYYY-MM-DD HH:MM:SS, Unix timestamp)",§_-4dj§.§_-4KU§).setRequired(true),new §_-2Xl§("finishTime","Finish challenge time (должно быть позже startTime)",§_-4dj§.§_-4KU§).setRequired(true)]);
         return _loc1_;
      }
      
      private function §_-2uO§() : Array
      {
         return §_-6aF§.toArray(§_-1FS§);
      }
      
      private function §_-6tN§(param1:String) : int
      {
         var _loc2_:String = null;
         for(_loc2_ in §_-1FS§)
         {
            if(§_-1FS§[_loc2_] == param1)
            {
               return parseInt(§_-1FS§[_loc2_]);
            }
         }
         return -1;
      }
      
      override protected function prepareParams(param1:Object) : §_-4Ww§
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         var _loc3_:int = this.§_-6tN§(param1["type"]);
         _loc2_.put("type",_loc3_);
         _loc2_.put("startTime",param1["startTime"]);
         _loc2_.put("finishTime",param1["finishTime"]);
         return _loc2_;
      }
   }
}

