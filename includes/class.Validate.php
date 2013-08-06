<?php
class Validate
{
    public static function is_Numeric($var)
    {
        if ($var == NULL) return true;
        return preg_match('/^-?[0-9]{1,4}$/', $var);
    }

    public static function is_Float($var)
    {
        if ($var == NULL) return true;
        return preg_match('/^-?[\d]+(|\.[\d]+)$/', $var);
    }

    public static function is_Bool($var)
    {
        return ($var == "1" || $var == "0");
    }

    public static function is_Email($var)
    {
        return preg_match('/^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/', $var);
    }

    public static function is_Set($var)
    {
        return isset($var);
    }

    public static function is_Phone($var)
    {
        return preg_match('/^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$/', $var);
    }

    public static function is_Login($var)
    {
        return preg_match('/^[a-zA-Z0-9]+$/', $var);
    }

    public static function is_Contacts($var)
    {
        return true;
    }

    public static function is_Date($var)
    {
        return (date('Y-m-d', strtotime($var)) == $var);
    }
}

//Testing functions
/*
$MyVal = new Validate;

echo  $MyVal->is_Phone("+79147994757")."\n";
echo  $MyVal->is_Phone("79147994757")."\n";
echo  $MyVal->is_Phone("89147994757")."\n";
echo  $MyVal->is_Phone("+89147994757")."\n";

echo $MyVal->is_Numeric("5")."\n";
echo $MyVal->is_Numeric("5+4")."\n";
echo $MyVal->is_Numeric("-5")."\n";
echo $MyVal->is_Numeric("0")."\n";

echo $MyVal->is_Float("-7.12")."\n";

echo $MyVal->is_Login("f3")."\n";
*/

?>
