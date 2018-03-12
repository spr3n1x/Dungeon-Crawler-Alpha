// @desc checkCollision(object, grid)
// @function checkCollision()
// @param object
// @param grid

var _obj = argument0;
var _grid = argument1;

var _topRight = _grid[# (_obj.bbox_right-1) div CELL_WIDTH, _obj.bbox_top div CELL_HEIGHT] == VOID;
var _topLeft = _grid[# _obj.bbox_left div CELL_WIDTH, _obj.bbox_top div CELL_HEIGHT] == VOID;
var _botRight = _grid[# (_obj.bbox_right-1) div CELL_WIDTH, (_obj.bbox_bottom - 1) div CELL_HEIGHT] == VOID;
var _botLeft = _grid[# _obj.bbox_left div CELL_WIDTH, (_obj.bbox_bottom - 1) div CELL_HEIGHT] == VOID;

return _topRight || _topLeft || _botRight || _botLeft;