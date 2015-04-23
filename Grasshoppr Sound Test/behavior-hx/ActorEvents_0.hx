package scripts;

import com.stencyl.graphics.G;
import com.stencyl.graphics.BitmapWrapper;

import com.stencyl.behavior.Script;
import com.stencyl.behavior.Script.*;
import com.stencyl.behavior.ActorScript;
import com.stencyl.behavior.SceneScript;
import com.stencyl.behavior.TimedTask;

import com.stencyl.models.Actor;
import com.stencyl.models.GameModel;
import com.stencyl.models.actor.Animation;
import com.stencyl.models.actor.ActorType;
import com.stencyl.models.actor.Collision;
import com.stencyl.models.actor.Group;
import com.stencyl.models.Scene;
import com.stencyl.models.Sound;
import com.stencyl.models.Region;
import com.stencyl.models.Font;

import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.Key;
import com.stencyl.utils.Utils;

import openfl.ui.Mouse;
import openfl.display.Graphics;
import openfl.display.BlendMode;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.events.TouchEvent;
import openfl.net.URLLoader;

import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2Fixture;
import box2D.dynamics.joints.B2Joint;

import motion.Actuate;
import motion.easing.Back;
import motion.easing.Cubic;
import motion.easing.Elastic;
import motion.easing.Expo;
import motion.easing.Linear;
import motion.easing.Quad;
import motion.easing.Quart;
import motion.easing.Quint;
import motion.easing.Sine;

import com.stencyl.graphics.shaders.BasicShader;
import com.stencyl.graphics.shaders.GrayscaleShader;
import com.stencyl.graphics.shaders.SepiaShader;
import com.stencyl.graphics.shaders.InvertShader;
import com.stencyl.graphics.shaders.GrainShader;
import com.stencyl.graphics.shaders.ExternalShader;
import com.stencyl.graphics.shaders.InlineShader;
import com.stencyl.graphics.shaders.BlurShader;
import com.stencyl.graphics.shaders.SharpenShader;
import com.stencyl.graphics.shaders.ScanlineShader;
import com.stencyl.graphics.shaders.CSBShader;
import com.stencyl.graphics.shaders.HueShader;
import com.stencyl.graphics.shaders.TintShader;
import com.stencyl.graphics.shaders.BloomShader;



class ActorEvents_0 extends ActorScript
{          	
	
public var _OnGround:Bool;

public var _Timer:Float;

public var _isJumping:Bool;

public var _Visable:Bool;

 
 	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("On Ground", "_OnGround");
_OnGround = false;
nameMap.set("Timer", "_Timer");
_Timer = 0.0;
nameMap.set("isJumping", "_isJumping");
_isJumping = false;
nameMap.set("Visable", "_Visable");
_Visable = false;

	}
	
	override public function init()
	{
		    
/* ======================== When Creating ========================= */
        actor.setCurrentFrame(Std.int(0));
    
/* ======================== When Updating ========================= */
addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        if(((_OnGround == false) && (_isJumping == false)))
{
            actor.setYVelocity(20);
}

}
});
    
/* =========================== Keyboard =========================== */
addKeyStateListener("left", function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void
{
if(wrapper.enabled && pressed)
{
        if((actor.getXVelocity() <= 0))
{
            actor.setXVelocity(-20);
}

}
});
    
/* =========================== Keyboard =========================== */
addKeyStateListener("up", function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void
{
if(wrapper.enabled && pressed)
{
        if((_isJumping == false))
{
            _isJumping = true;
propertyChanged("_isJumping", _isJumping);
            if((_OnGround == true))
{
                _OnGround = false;
propertyChanged("_OnGround", _OnGround);
                actor.setYVelocity(-25);
}

}

}
});
    
/* ======================== Something Else ======================== */
addCollisionListener(actor, function(event:Collision, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        if((_OnGround == false))
{
            _OnGround = true;
propertyChanged("_OnGround", _OnGround);
}

        if(!(actor.getXVelocity() == 0))
{
            actor.setYVelocity(0);
}

        if((_isJumping == true))
{
            _isJumping = false;
propertyChanged("_isJumping", _isJumping);
}

}
});
    
/* =========================== Keyboard =========================== */
addKeyStateListener("left", function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void
{
if(wrapper.enabled && released)
{
        if(!(actor.getXVelocity() == 0))
{
            actor.setXVelocity(0);
}

}
});
    
/* =========================== Keyboard =========================== */
addKeyStateListener("right", function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void
{
if(wrapper.enabled && pressed)
{
        if((actor.getXVelocity() >= 0))
{
            actor.setXVelocity(20);
}

}
});
    
/* =========================== Keyboard =========================== */
addKeyStateListener("right", function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void
{
if(wrapper.enabled && released)
{
        if(!(actor.getXVelocity() == 0))
{
            actor.setXVelocity(0);
}

}
});
    
/* =========================== Keyboard =========================== */
addKeyStateListener("action2", function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void
{
if(wrapper.enabled && pressed)
{
        if((actor.getAnimation() == "Animation 0"))
{
            actor.setAnimation("" + "Animation 1");
}

        else
{
            while(isKeyDown("action2"))
{
                if(!(actor.getAnimation() == "Animation 1"))
{
                    actor.setAnimation("" + "Animation 1");
}

}

}

}
});
    
/* =========================== Keyboard =========================== */
addKeyStateListener("action2", function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void
{
if(wrapper.enabled && released)
{
        if(!(actor.getAnimation() == "Animation 0"))
{
            actor.setAnimation("" + "Animation 0");
}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}