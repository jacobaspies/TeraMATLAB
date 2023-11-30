%% Move Zaber stage


function [] = move_zaber_stage(stage,position)
    import zaber.motion.Units;
    stage.moveAbsolute(position, Units.LENGTH_MILLIMETRES);
end