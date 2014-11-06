package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.system.Capabilities;
	import flash.desktop.NativeApplication;
	import flash.desktop.SystemIdleMode;
	
	
	public class Main extends MovieClip {
		
		
		public function Main() {
			// constructor code
			if(Capabilities.cpuArchitecture=="ARM"){
				//les fonctions suivantes seront actives seulement sur mobile:
				NativeApplication.nativeApplication.addEventListener(Event.ACTIVATE, activationMobile, false, 0, true);
				NativeApplication.nativeApplication.addEventListener(Event.DEACTIVATE, desactivationMobile, false, 0, true);
				NativeApplication.nativeApplication.addEventListener(KeyboardEvent.KEY_DOWN, frappeBtnMobile, false, 0, true);
			}
		}
		
		
		/******************************************************************************
		Fonction activationMobile
		 Elle permet d'empécher que l'appareil passe en veille surant le jeu
		******************************************************************************/
		private function activationMobile(e:Event):void{
			NativeApplication.nativeApplication.systemIdleMode = SystemIdleMode.KEEP_AWAKE;
			//On Android, the application must specify the Android permissions for 
			//DISABLE_KEYGUARD and WAKE_LOCK in the application descriptor 
			//or the operating system will not honor this setting.
		}
		 
		/******************************************************************************
		Fonction desactivationMobile
		 Elle arrete le jeu si le jeu est masque par l'appareil
		 (a l'activation du bureau ou d'une autre application)
		 Sans cette fonction, la musique et les ecouteurs demeureraient actifs...
		******************************************************************************/
		private function desactivationMobile(e:Event):void{
			NativeApplication.nativeApplication.exit();
		}
		 
		/******************************************************************************
		Fonction frappeBtnMobile
		 Elle quitte le jeu si le joueur appuie sur la touche «back»
		******************************************************************************/
		private function frappeBtnMobile(e:KeyboardEvent):void{
			if(e.keyCode == Keyboard.BACK){
				NativeApplication.nativeApplication.exit();
			}
		}
	}
	
}

//CHANGEMENT À FAIRE DANS JEU.AS:
//private var _ctrlPadActif:Boolean = (Capabilities.cpuArchitecture=="ARM"); //le ctrlPad sera actif seulement sur mobile