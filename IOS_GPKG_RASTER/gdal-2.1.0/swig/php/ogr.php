<?php

/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 1.3.40
 * 
 * This file is not intended to be easily readable and contains a number of 
 * coding conventions designed to improve portability and efficiency. Do not make
 * changes to this file unless you know what you are doing--modify the SWIG 
 * interface file instead. 
 * ----------------------------------------------------------------------------- */

// Try to load our extension if it's not already loaded.
if (!extension_loaded('ogr')) {
  if (strtolower(substr(PHP_OS, 0, 3)) === 'win') {
    if (!dl('php_ogr.dll')) return;
  } else {
    // PHP_SHLIB_SUFFIX gives 'dylib' on MacOS X but modules are 'so'.
    if (PHP_SHLIB_SUFFIX === 'dylib') {
      if (!dl('ogr.so')) return;
    } else {
      if (!dl('ogr.'.PHP_SHLIB_SUFFIX)) return;
    }
  }
}



abstract class ogr {
	const wkb25DBit = wkb25DBit;

	const wkb25Bit = wkb25Bit;

	const wkbUnknown = wkbUnknown;

	const wkbPoint = wkbPoint;

	const wkbLineString = wkbLineString;

	const wkbPolygon = wkbPolygon;

	const wkbMultiPoint = wkbMultiPoint;

	const wkbMultiLineString = wkbMultiLineString;

	const wkbMultiPolygon = wkbMultiPolygon;

	const wkbGeometryCollection = wkbGeometryCollection;

	const wkbNone = wkbNone;

	const wkbLinearRing = wkbLinearRing;

	const wkbPoint25D = wkbPoint25D;

	const wkbLineString25D = wkbLineString25D;

	const wkbPolygon25D = wkbPolygon25D;

	const wkbMultiPoint25D = wkbMultiPoint25D;

	const wkbMultiLineString25D = wkbMultiLineString25D;

	const wkbMultiPolygon25D = wkbMultiPolygon25D;

	const wkbGeometryCollection25D = wkbGeometryCollection25D;

	const OFTInteger = OFTInteger;

	const OFTIntegerList = OFTIntegerList;

	const OFTReal = OFTReal;

	const OFTRealList = OFTRealList;

	const OFTString = OFTString;

	const OFTStringList = OFTStringList;

	const OFTWideString = OFTWideString;

	const OFTWideStringList = OFTWideStringList;

	const OFTBinary = OFTBinary;

	const OFTDate = OFTDate;

	const OFTTime = OFTTime;

	const OFTDateTime = OFTDateTime;

	const OJUndefined = OJUndefined;

	const OJLeft = OJLeft;

	const OJRight = OJRight;

	const wkbXDR = wkbXDR;

	const wkbNDR = wkbNDR;

	const NullFID = NullFID;

	const OLCRandomRead = OLCRandomRead;

	const OLCSequentialWrite = OLCSequentialWrite;

	const OLCRandomWrite = OLCRandomWrite;

	const OLCFastSpatialFilter = OLCFastSpatialFilter;

	const OLCFastFeatureCount = OLCFastFeatureCount;

	const OLCFastGetExtent = OLCFastGetExtent;

	const OLCCreateField = OLCCreateField;

	const OLCTransactions = OLCTransactions;

	const OLCDeleteFeature = OLCDeleteFeature;

	const OLCFastSetNextByIndex = OLCFastSetNextByIndex;

	const OLCStringsAsUTF8 = OLCStringsAsUTF8;

	const OLCIgnoreFields = OLCIgnoreFields;

	const ODsCCreateLayer = ODsCCreateLayer;

	const ODsCDeleteLayer = ODsCDeleteLayer;

	const ODrCCreateDataSource = ODrCCreateDataSource;

	const ODrCDeleteDataSource = ODrCDeleteDataSource;

	static function CreateGeometryFromWkb($len,$reference=null) {
		$r=CreateGeometryFromWkb($len,$reference);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Geometry($r);
			}
			return new $c($r);
		}
		return $r;
	}

	static function CreateGeometryFromWkt($val,$reference=null) {
		$r=CreateGeometryFromWkt($val,$reference);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Geometry($r);
			}
			return new $c($r);
		}
		return $r;
	}

	static function CreateGeometryFromGML($input_string) {
		$r=CreateGeometryFromGML($input_string);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Geometry($r);
			}
			return new $c($r);
		}
		return $r;
	}

	static function CreateGeometryFromJson($input_string) {
		$r=CreateGeometryFromJson($input_string);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Geometry($r);
			}
			return new $c($r);
		}
		return $r;
	}

	static function BuildPolygonFromEdges($hLineCollection,$bBestEffort=0,$bAutoClose=0,$dfTolerance=0.0) {
		$r=BuildPolygonFromEdges($hLineCollection,$bBestEffort,$bAutoClose,$dfTolerance);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Geometry($r);
			}
			return new $c($r);
		}
		return $r;
	}

	static function ApproximateArcAngles($dfCenterX,$dfCenterY,$dfZ,$dfPrimaryRadius,$dfSecondaryAxis,$dfRotation,$dfStartAngle,$dfEndAngle,$dfMaxAngleStepSizeDegrees) {
		$r=ApproximateArcAngles($dfCenterX,$dfCenterY,$dfZ,$dfPrimaryRadius,$dfSecondaryAxis,$dfRotation,$dfStartAngle,$dfEndAngle,$dfMaxAngleStepSizeDegrees);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Geometry($r);
			}
			return new $c($r);
		}
		return $r;
	}

	static function ForceToPolygon($geom_in) {
		$r=ForceToPolygon($geom_in);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Geometry($r);
			}
			return new $c($r);
		}
		return $r;
	}

	static function ForceToMultiPolygon($geom_in) {
		$r=ForceToMultiPolygon($geom_in);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Geometry($r);
			}
			return new $c($r);
		}
		return $r;
	}

	static function ForceToMultiPoint($geom_in) {
		$r=ForceToMultiPoint($geom_in);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Geometry($r);
			}
			return new $c($r);
		}
		return $r;
	}

	static function ForceToMultiLineString($geom_in) {
		$r=ForceToMultiLineString($geom_in);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Geometry($r);
			}
			return new $c($r);
		}
		return $r;
	}

	static function OGRGetDriverCount() {
		return OGRGetDriverCount();
	}

	static function OGRGetOpenDSCount() {
		return OGRGetOpenDSCount();
	}

	static function OGRSetGenerate_DB2_V72_BYTE_ORDER($bGenerate_DB2_V72_BYTE_ORDER) {
		return OGRSetGenerate_DB2_V72_BYTE_ORDER($bGenerate_DB2_V72_BYTE_ORDER);
	}

	static function OGRRegisterAll() {
		OGRRegisterAll();
	}

	static function GeometryTypeToName($eType) {
		return GeometryTypeToName($eType);
	}

	static function GetFieldTypeName($type) {
		return GetFieldTypeName($type);
	}

	static function GetOpenDS($ds_number) {
		$r=GetOpenDS($ds_number);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new DataSource($r);
			}
			return new $c($r);
		}
		return $r;
	}

	static function Open($filename,$update=0) {
		$r=Open($filename,$update);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new DataSource($r);
			}
			return new $c($r);
		}
		return $r;
	}

	static function OpenShared($utf8_path,$update=0) {
		$r=OpenShared($utf8_path,$update);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new DataSource($r);
			}
			return new $c($r);
		}
		return $r;
	}

	static function GetDriverByName($name) {
		$r=GetDriverByName($name);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Driver($r);
			}
			return new $c($r);
		}
		return $r;
	}

	static function GetDriver($driver_number) {
		$r=GetDriver($driver_number);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Driver($r);
			}
			return new $c($r);
		}
		return $r;
	}

	static function GeneralCmdLineProcessor($papszArgv,$nOptions=0) {
		return GeneralCmdLineProcessor($papszArgv,$nOptions);
	}
}

/* PHP Proxy Classes */
class Driver {
	public $_cPtr=null;
	protected $_pData=array();

	function __set($var,$value) {
		if ($var === 'thisown') return swig_ogr_alter_newobject($this->_cPtr,$value);
		$this->_pData[$var] = $value;
	}

	function __isset($var) {
		if ($var === 'thisown') return true;
		return array_key_exists($var, $this->_pData);
	}

	function __get($var) {
		$func = 'Driver_'.$var.'_get';
		if (function_exists($func)) {
			$r = call_user_func($func,$this->_cPtr);
			if (!is_resource($r)) return $r;
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			return new $c($r);
		}
		if ($var === 'thisown') return swig_ogr_get_newobject($this->_cPtr);
		return $this->_pData[$var];
	}
	function __construct($h) {
		$this->_cPtr=$h;
	}

	public function CreateDataSource($name,$options=null) {
		$r=Driver_CreateDataSource($this->_cPtr,$name,$options);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new DataSource($r);
			}
			return new $c($r);
		}
		return $r;
	}

	public function CopyDataSource($copy_ds,$utf8_path,$options=null) {
		$r=Driver_CopyDataSource($this->_cPtr,$copy_ds,$utf8_path,$options);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new DataSource($r);
			}
			return new $c($r);
		}
		return $r;
	}

	public function Open($utf8_path,$update=0) {
		$r=Driver_Open($this->_cPtr,$utf8_path,$update);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new DataSource($r);
			}
			return new $c($r);
		}
		return $r;
	}

	public function DeleteDataSource($name) {
		return Driver_DeleteDataSource($this->_cPtr,$name);
	}

	public function TestCapability($cap) {
		return Driver_TestCapability($this->_cPtr,$cap);
	}

	public function GetName() {
		return Driver_GetName($this->_cPtr);
	}

	public function Register() {
		Driver_Register($this->_cPtr);
	}

	public function Deregister() {
		Driver_Deregister($this->_cPtr);
	}
}

class DataSource {
	public $_cPtr=null;
	protected $_pData=array();

	function __set($var,$value) {
		if ($var === 'thisown') return swig_ogr_alter_newobject($this->_cPtr,$value);
		$this->_pData[$var] = $value;
	}

	function __isset($var) {
		if ($var === 'thisown') return true;
		return array_key_exists($var, $this->_pData);
	}

	function __get($var) {
		$func = 'DataSource_'.$var.'_get';
		if (function_exists($func)) {
			$r = call_user_func($func,$this->_cPtr);
			if (!is_resource($r)) return $r;
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			return new $c($r);
		}
		if ($var === 'thisown') return swig_ogr_get_newobject($this->_cPtr);
		return $this->_pData[$var];
	}
	function __construct($h) {
		$this->_cPtr=$h;
	}

	public function GetRefCount() {
		return DataSource_GetRefCount($this->_cPtr);
	}

	public function GetSummaryRefCount() {
		return DataSource_GetSummaryRefCount($this->_cPtr);
	}

	public function GetLayerCount() {
		return DataSource_GetLayerCount($this->_cPtr);
	}

	public function GetDriver() {
		$r=DataSource_GetDriver($this->_cPtr);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Driver($r);
			}
			return new $c($r);
		}
		return $r;
	}

	public function GetName() {
		return DataSource_GetName($this->_cPtr);
	}

	public function DeleteLayer($index) {
		return DataSource_DeleteLayer($this->_cPtr,$index);
	}

	public function CreateLayer($name,$srs=null,$geom_type=null,$options=null) {
		switch (func_num_args()) {
		case 1: case 2: $r=DataSource_CreateLayer($this->_cPtr,$name,$srs); break;
		default: $r=DataSource_CreateLayer($this->_cPtr,$name,$srs,$geom_type,$options);
		}
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Layer($r);
			}
			return new $c($r);
		}
		return $r;
	}

	public function CopyLayer($src_layer,$new_name,$options=null) {
		$r=DataSource_CopyLayer($this->_cPtr,$src_layer,$new_name,$options);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Layer($r);
			}
			return new $c($r);
		}
		return $r;
	}

	public function GetLayerByIndex($index=0) {
		$r=DataSource_GetLayerByIndex($this->_cPtr,$index);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Layer($r);
			}
			return new $c($r);
		}
		return $r;
	}

	public function GetLayerByName($layer_name) {
		$r=DataSource_GetLayerByName($this->_cPtr,$layer_name);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Layer($r);
			}
			return new $c($r);
		}
		return $r;
	}

	public function TestCapability($cap) {
		return DataSource_TestCapability($this->_cPtr,$cap);
	}

	public function ExecuteSQL($statement,$spatialFilter=null,$dialect="") {
		$r=DataSource_ExecuteSQL($this->_cPtr,$statement,$spatialFilter,$dialect);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Layer($r);
			}
			return new $c($r);
		}
		return $r;
	}

	public function ReleaseResultSet($layer) {
		DataSource_ReleaseResultSet($this->_cPtr,$layer);
	}
}

class Layer {
	public $_cPtr=null;
	protected $_pData=array();

	function __set($var,$value) {
		if ($var === 'thisown') return swig_ogr_alter_newobject($this->_cPtr,$value);
		$this->_pData[$var] = $value;
	}

	function __isset($var) {
		if ($var === 'thisown') return true;
		return array_key_exists($var, $this->_pData);
	}

	function __get($var) {
		if ($var === 'thisown') return swig_ogr_get_newobject($this->_cPtr);
		return $this->_pData[$var];
	}
	function __construct($h) {
		$this->_cPtr=$h;
	}

	public function GetRefCount() {
		return Layer_GetRefCount($this->_cPtr);
	}

	public function SetSpatialFilter($filter) {
		Layer_SetSpatialFilter($this->_cPtr,$filter);
	}

	public function SetSpatialFilterRect($minx,$miny,$maxx,$maxy) {
		Layer_SetSpatialFilterRect($this->_cPtr,$minx,$miny,$maxx,$maxy);
	}

	public function GetSpatialFilter() {
		$r=Layer_GetSpatialFilter($this->_cPtr);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Geometry($r);
			}
			return new $c($r);
		}
		return $r;
	}

	public function SetAttributeFilter($filter_string) {
		return Layer_SetAttributeFilter($this->_cPtr,$filter_string);
	}

	public function ResetReading() {
		Layer_ResetReading($this->_cPtr);
	}

	public function GetName() {
		return Layer_GetName($this->_cPtr);
	}

	public function GetGeomType() {
		return Layer_GetGeomType($this->_cPtr);
	}

	public function GetGeometryColumn() {
		return Layer_GetGeometryColumn($this->_cPtr);
	}

	public function GetFIDColumn() {
		return Layer_GetFIDColumn($this->_cPtr);
	}

	public function GetFeature($fid) {
		$r=Layer_GetFeature($this->_cPtr,$fid);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Feature($r);
			}
			return new $c($r);
		}
		return $r;
	}

	public function GetNextFeature() {
		$r=Layer_GetNextFeature($this->_cPtr);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Feature($r);
			}
			return new $c($r);
		}
		return $r;
	}

	public function SetNextByIndex($new_index) {
		return Layer_SetNextByIndex($this->_cPtr,$new_index);
	}

	public function SetFeature($feature) {
		return Layer_SetFeature($this->_cPtr,$feature);
	}

	public function CreateFeature($feature) {
		return Layer_CreateFeature($this->_cPtr,$feature);
	}

	public function DeleteFeature($fid) {
		return Layer_DeleteFeature($this->_cPtr,$fid);
	}

	public function SyncToDisk() {
		return Layer_SyncToDisk($this->_cPtr);
	}

	public function GetLayerDefn() {
		$r=Layer_GetLayerDefn($this->_cPtr);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new FeatureDefn($r);
			}
			return new $c($r);
		}
		return $r;
	}

	public function GetFeatureCount($force=1) {
		return Layer_GetFeatureCount($this->_cPtr,$force);
	}

	public function GetExtent($force=1) {
		return Layer_GetExtent($this->_cPtr,$force);
	}

	public function TestCapability($cap) {
		return Layer_TestCapability($this->_cPtr,$cap);
	}

	public function CreateField($field_def,$approx_ok=1) {
		return Layer_CreateField($this->_cPtr,$field_def,$approx_ok);
	}

	public function StartTransaction() {
		return Layer_StartTransaction($this->_cPtr);
	}

	public function CommitTransaction() {
		return Layer_CommitTransaction($this->_cPtr);
	}

	public function RollbackTransaction() {
		return Layer_RollbackTransaction($this->_cPtr);
	}

	public function GetSpatialRef() {
		$r=Layer_GetSpatialRef($this->_cPtr);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new SpatialReference($r);
			}
			return new $c($r);
		}
		return $r;
	}

	public function GetFeaturesRead() {
		return Layer_GetFeaturesRead($this->_cPtr);
	}

	public function SetIgnoredFields($options) {
		return Layer_SetIgnoredFields($this->_cPtr,$options);
	}
}

class Feature {
	public $_cPtr=null;
	protected $_pData=array();

	function __set($var,$value) {
		if ($var === 'thisown') return swig_ogr_alter_newobject($this->_cPtr,$value);
		$this->_pData[$var] = $value;
	}

	function __isset($var) {
		if ($var === 'thisown') return true;
		return array_key_exists($var, $this->_pData);
	}

	function __get($var) {
		if ($var === 'thisown') return swig_ogr_get_newobject($this->_cPtr);
		return $this->_pData[$var];
	}

	public function __construct($feature_def) {
		if (is_resource($feature_def) && get_resource_type($feature_def) === '_p_OGRFeatureShadow') {
			$this->_cPtr=$feature_def;
			return;
		}
		$this->_cPtr=new_Feature($feature_def);
	}

	public function GetDefnRef() {
		$r=Feature_GetDefnRef($this->_cPtr);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new FeatureDefn($r);
			}
			return new $c($r);
		}
		return $r;
	}

	public function SetGeometry($geom) {
		return Feature_SetGeometry($this->_cPtr,$geom);
	}

	public function SetGeometryDirectly($geom) {
		return Feature_SetGeometryDirectly($this->_cPtr,$geom);
	}

	public function GetGeometryRef() {
		$r=Feature_GetGeometryRef($this->_cPtr);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Geometry($r);
			}
			return new $c($r);
		}
		return $r;
	}

	public function c_Clone() {
		$r=Feature_c_Clone($this->_cPtr);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Feature($r);
			}
			return new $c($r);
		}
		return $r;
	}

	public function Equal($feature) {
		return Feature_Equal($this->_cPtr,$feature);
	}

	public function GetFieldCount() {
		return Feature_GetFieldCount($this->_cPtr);
	}

	public function GetFieldDefnRef($id_or_name) {
		$r=Feature_GetFieldDefnRef($this->_cPtr,$id_or_name);
		if (!is_resource($r)) return $r;
		switch (get_resource_type($r)) {
		case '_p_OGRFieldDefnShadow': return new FieldDefn($r);
		default: return new FieldDefn($r);
		}
	}

	public function GetFieldAsString($id_or_name) {
		return Feature_GetFieldAsString($this->_cPtr,$id_or_name);
	}

	public function GetFieldAsInteger($id_or_name) {
		return Feature_GetFieldAsInteger($this->_cPtr,$id_or_name);
	}

	public function GetFieldAsDouble($id_or_name) {
		return Feature_GetFieldAsDouble($this->_cPtr,$id_or_name);
	}

	public function GetFieldAsDateTime($id) {
		Feature_GetFieldAsDateTime($this->_cPtr,$id);
	}

	public function GetFieldAsIntegerList($id,$nLen,$pList) {
		Feature_GetFieldAsIntegerList($this->_cPtr,$id,$nLen,$pList);
	}

	public function GetFieldAsDoubleList($id,$nLen,$pList) {
		Feature_GetFieldAsDoubleList($this->_cPtr,$id,$nLen,$pList);
	}

	public function GetFieldAsStringList($id,$pList) {
		Feature_GetFieldAsStringList($this->_cPtr,$id,$pList);
	}

	public function IsFieldSet($id_or_name) {
		return Feature_IsFieldSet($this->_cPtr,$id_or_name);
	}

	public function GetFieldIndex($name) {
		return Feature_GetFieldIndex($this->_cPtr,$name);
	}

	public function GetFID() {
		return Feature_GetFID($this->_cPtr);
	}

	public function SetFID($fid) {
		return Feature_SetFID($this->_cPtr,$fid);
	}

	public function DumpReadable() {
		Feature_DumpReadable($this->_cPtr);
	}

	public function UnsetField($id_or_name) {
		Feature_UnsetField($this->_cPtr,$id_or_name);
	}

	public function SetField($id_or_name,$value_or_year,$month=null,$day=null,$hour=null,$minute=null,$second=null,$tzflag=null) {
		switch (func_num_args()) {
		case 2: Feature_SetField($this->_cPtr,$id_or_name,$value_or_year); break;
		case 3: Feature_SetField($this->_cPtr,$id_or_name,$value_or_year,$month); break;
		case 4: Feature_SetField($this->_cPtr,$id_or_name,$value_or_year,$month,$day); break;
		case 5: Feature_SetField($this->_cPtr,$id_or_name,$value_or_year,$month,$day,$hour); break;
		case 6: Feature_SetField($this->_cPtr,$id_or_name,$value_or_year,$month,$day,$hour,$minute); break;
		case 7: Feature_SetField($this->_cPtr,$id_or_name,$value_or_year,$month,$day,$hour,$minute,$second); break;
		default: Feature_SetField($this->_cPtr,$id_or_name,$value_or_year,$month,$day,$hour,$minute,$second,$tzflag);
		}
	}

	public function SetFieldIntegerList($id,$nList) {
		Feature_SetFieldIntegerList($this->_cPtr,$id,$nList);
	}

	public function SetFieldDoubleList($id,$nList,$pList) {
		Feature_SetFieldDoubleList($this->_cPtr,$id,$nList,$pList);
	}

	public function SetFieldStringList($id,$pList) {
		Feature_SetFieldStringList($this->_cPtr,$id,$pList);
	}

	public function SetFrom($other,$forgiving=1) {
		return Feature_SetFrom($this->_cPtr,$other,$forgiving);
	}

	public function GetStyleString() {
		return Feature_GetStyleString($this->_cPtr);
	}

	public function SetStyleString($the_string) {
		Feature_SetStyleString($this->_cPtr,$the_string);
	}

	public function GetFieldType($id_or_name) {
		return Feature_GetFieldType($this->_cPtr,$id_or_name);
	}
}

class FeatureDefn {
	public $_cPtr=null;
	protected $_pData=array();

	function __set($var,$value) {
		if ($var === 'thisown') return swig_ogr_alter_newobject($this->_cPtr,$value);
		$this->_pData[$var] = $value;
	}

	function __isset($var) {
		if ($var === 'thisown') return true;
		return array_key_exists($var, $this->_pData);
	}

	function __get($var) {
		if ($var === 'thisown') return swig_ogr_get_newobject($this->_cPtr);
		return $this->_pData[$var];
	}

	public function __construct($name_null_ok=null) {
		if (is_resource($name_null_ok) && get_resource_type($name_null_ok) === '_p_OGRFeatureDefnShadow') {
			$this->_cPtr=$name_null_ok;
			return;
		}
		$this->_cPtr=$r;
		switch (func_num_args()) {
		case 0: $this->_cPtr=new_FeatureDefn(); break;
		default: $this->_cPtr=new_FeatureDefn($name_null_ok);
		}
	}

	public function GetName() {
		return FeatureDefn_GetName($this->_cPtr);
	}

	public function GetFieldCount() {
		return FeatureDefn_GetFieldCount($this->_cPtr);
	}

	public function GetFieldDefn($i) {
		$r=FeatureDefn_GetFieldDefn($this->_cPtr,$i);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new FieldDefn($r);
			}
			return new $c($r);
		}
		return $r;
	}

	public function GetFieldIndex($name) {
		return FeatureDefn_GetFieldIndex($this->_cPtr,$name);
	}

	public function AddFieldDefn($defn) {
		FeatureDefn_AddFieldDefn($this->_cPtr,$defn);
	}

	public function GetGeomType() {
		return FeatureDefn_GetGeomType($this->_cPtr);
	}

	public function SetGeomType($geom_type) {
		FeatureDefn_SetGeomType($this->_cPtr,$geom_type);
	}

	public function GetReferenceCount() {
		return FeatureDefn_GetReferenceCount($this->_cPtr);
	}

	public function IsGeometryIgnored() {
		return FeatureDefn_IsGeometryIgnored($this->_cPtr);
	}

	public function SetGeometryIgnored($bIgnored) {
		FeatureDefn_SetGeometryIgnored($this->_cPtr,$bIgnored);
	}

	public function IsStyleIgnored() {
		return FeatureDefn_IsStyleIgnored($this->_cPtr);
	}

	public function SetStyleIgnored($bIgnored) {
		FeatureDefn_SetStyleIgnored($this->_cPtr,$bIgnored);
	}
}

class FieldDefn {
	public $_cPtr=null;
	protected $_pData=array();

	function __set($var,$value) {
		if ($var === 'thisown') return swig_ogr_alter_newobject($this->_cPtr,$value);
		$this->_pData[$var] = $value;
	}

	function __isset($var) {
		if ($var === 'thisown') return true;
		return array_key_exists($var, $this->_pData);
	}

	function __get($var) {
		if ($var === 'thisown') return swig_ogr_get_newobject($this->_cPtr);
		return $this->_pData[$var];
	}

	public function __construct($name_null_ok="unnamed",$field_type=null) {
		if (is_resource($name_null_ok) && get_resource_type($name_null_ok) === '_p_OGRFieldDefnShadow') {
			$this->_cPtr=$name_null_ok;
			return;
		}
		$this->_cPtr=$r;
		switch (func_num_args()) {
		case 0: case 1: $this->_cPtr=new_FieldDefn($name_null_ok); break;
		default: $this->_cPtr=new_FieldDefn($name_null_ok,$field_type);
		}
	}

	public function GetName() {
		return FieldDefn_GetName($this->_cPtr);
	}

	public function GetNameRef() {
		return FieldDefn_GetNameRef($this->_cPtr);
	}

	public function SetName($name) {
		FieldDefn_SetName($this->_cPtr,$name);
	}

	public function GetType() {
		return FieldDefn_GetType($this->_cPtr);
	}

	public function SetType($type) {
		FieldDefn_SetType($this->_cPtr,$type);
	}

	public function GetJustify() {
		return FieldDefn_GetJustify($this->_cPtr);
	}

	public function SetJustify($justify) {
		FieldDefn_SetJustify($this->_cPtr,$justify);
	}

	public function GetWidth() {
		return FieldDefn_GetWidth($this->_cPtr);
	}

	public function SetWidth($width) {
		FieldDefn_SetWidth($this->_cPtr,$width);
	}

	public function GetPrecision() {
		return FieldDefn_GetPrecision($this->_cPtr);
	}

	public function SetPrecision($precision) {
		FieldDefn_SetPrecision($this->_cPtr,$precision);
	}

	public function GetTypeName() {
		return FieldDefn_GetTypeName($this->_cPtr);
	}

	public function GetFieldTypeName($type) {
		return FieldDefn_GetFieldTypeName($this->_cPtr,$type);
	}

	public function IsIgnored() {
		return FieldDefn_IsIgnored($this->_cPtr);
	}

	public function SetIgnored($bIgnored) {
		FieldDefn_SetIgnored($this->_cPtr,$bIgnored);
	}
}

class Geometry {
	public $_cPtr=null;
	protected $_pData=array();

	function __set($var,$value) {
		if ($var === 'thisown') return swig_ogr_alter_newobject($this->_cPtr,$value);
		$this->_pData[$var] = $value;
	}

	function __isset($var) {
		if ($var === 'thisown') return true;
		return array_key_exists($var, $this->_pData);
	}

	function __get($var) {
		if ($var === 'thisown') return swig_ogr_get_newobject($this->_cPtr);
		return $this->_pData[$var];
	}

	public function __construct($type=null,$wkt=null,$wkb=0,$gml=null) {
		if (is_resource($type) && get_resource_type($type) === '_p_OGRGeometryShadow') {
			$this->_cPtr=$type;
			return;
		}
		$this->_cPtr=$r;
		switch (func_num_args()) {
		case 0: $this->_cPtr=new_Geometry(); break;
		case 1: $this->_cPtr=new_Geometry($type); break;
		case 2: case 3: $this->_cPtr=new_Geometry($type,$wkt,$wkb); break;
		default: $this->_cPtr=new_Geometry($type,$wkt,$wkb,$gml);
		}
	}

	public function ExportToWkt() {
		return Geometry_ExportToWkt($this->_cPtr);
	}

	public function ExportToWkb($byte_order=null) {
		switch (func_num_args()) {
		case 0: $r=Geometry_ExportToWkb($this->_cPtr); break;
		default: $r=Geometry_ExportToWkb($this->_cPtr,$byte_order);
		}
		return $r;
	}

	public function ExportToGML() {
		return Geometry_ExportToGML($this->_cPtr);
	}

	public function ExportToKML($altitude_mode=null) {
		switch (func_num_args()) {
		case 0: $r=Geometry_ExportToKML($this->_cPtr); break;
		default: $r=Geometry_ExportToKML($this->_cPtr,$altitude_mode);
		}
		return $r;
	}

	public function ExportToJson() {
		return Geometry_ExportToJson($this->_cPtr);
	}

	public function AddPoint($x,$y,$z=0.0) {
		Geometry_AddPoint($this->_cPtr,$x,$y,$z);
	}

	public function AddPoint_2D($x,$y) {
		Geometry_AddPoint_2D($this->_cPtr,$x,$y);
	}

	public function AddGeometryDirectly($other_disown) {
		return Geometry_AddGeometryDirectly($this->_cPtr,$other_disown);
	}

	public function AddGeometry($other) {
		return Geometry_AddGeometry($this->_cPtr,$other);
	}

	public function c_Clone() {
		$r=Geometry_c_Clone($this->_cPtr);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Geometry($r);
			}
			return new $c($r);
		}
		return $r;
	}

	public function GetGeometryType() {
		return Geometry_GetGeometryType($this->_cPtr);
	}

	public function GetGeometryName() {
		return Geometry_GetGeometryName($this->_cPtr);
	}

	public function Length() {
		return Geometry_Length($this->_cPtr);
	}

	public function Area() {
		return Geometry_Area($this->_cPtr);
	}

	public function GetArea() {
		return Geometry_GetArea($this->_cPtr);
	}

	public function GetPointCount() {
		return Geometry_GetPointCount($this->_cPtr);
	}

	public function GetX($point=0) {
		return Geometry_GetX($this->_cPtr,$point);
	}

	public function GetY($point=0) {
		return Geometry_GetY($this->_cPtr,$point);
	}

	public function GetZ($point=0) {
		return Geometry_GetZ($this->_cPtr,$point);
	}

	public function GetPoint($iPoint=0) {
		Geometry_GetPoint($this->_cPtr,$iPoint);
	}

	public function GetPoint_2D($iPoint=0) {
		Geometry_GetPoint_2D($this->_cPtr,$iPoint);
	}

	public function GetGeometryCount() {
		return Geometry_GetGeometryCount($this->_cPtr);
	}

	public function SetPoint($point,$x,$y,$z=0.0) {
		Geometry_SetPoint($this->_cPtr,$point,$x,$y,$z);
	}

	public function SetPoint_2D($point,$x,$y) {
		Geometry_SetPoint_2D($this->_cPtr,$point,$x,$y);
	}

	public function GetGeometryRef($geom) {
		$r=Geometry_GetGeometryRef($this->_cPtr,$geom);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Geometry($r);
			}
			return new $c($r);
		}
		return $r;
	}

	public function Simplify($tolerance) {
		$r=Geometry_Simplify($this->_cPtr,$tolerance);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Geometry($r);
			}
			return new $c($r);
		}
		return $r;
	}

	public function Boundary() {
		$r=Geometry_Boundary($this->_cPtr);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Geometry($r);
			}
			return new $c($r);
		}
		return $r;
	}

	public function GetBoundary() {
		$r=Geometry_GetBoundary($this->_cPtr);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Geometry($r);
			}
			return new $c($r);
		}
		return $r;
	}

	public function ConvexHull() {
		$r=Geometry_ConvexHull($this->_cPtr);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Geometry($r);
			}
			return new $c($r);
		}
		return $r;
	}

	public function Buffer($distance,$quadsecs=30) {
		$r=Geometry_Buffer($this->_cPtr,$distance,$quadsecs);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Geometry($r);
			}
			return new $c($r);
		}
		return $r;
	}

	public function Intersection($other) {
		$r=Geometry_Intersection($this->_cPtr,$other);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Geometry($r);
			}
			return new $c($r);
		}
		return $r;
	}

	public function Union($other) {
		$r=Geometry_Union($this->_cPtr,$other);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Geometry($r);
			}
			return new $c($r);
		}
		return $r;
	}

	public function UnionCascaded() {
		$r=Geometry_UnionCascaded($this->_cPtr);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Geometry($r);
			}
			return new $c($r);
		}
		return $r;
	}

	public function Difference($other) {
		$r=Geometry_Difference($this->_cPtr,$other);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Geometry($r);
			}
			return new $c($r);
		}
		return $r;
	}

	public function SymDifference($other) {
		$r=Geometry_SymDifference($this->_cPtr,$other);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Geometry($r);
			}
			return new $c($r);
		}
		return $r;
	}

	public function SymmetricDifference($other) {
		$r=Geometry_SymmetricDifference($this->_cPtr,$other);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Geometry($r);
			}
			return new $c($r);
		}
		return $r;
	}

	public function Distance($other) {
		return Geometry_Distance($this->_cPtr,$other);
	}

	public function c_Empty() {
		Geometry_c_Empty($this->_cPtr);
	}

	public function IsEmpty() {
		return Geometry_IsEmpty($this->_cPtr);
	}

	public function IsValid() {
		return Geometry_IsValid($this->_cPtr);
	}

	public function IsSimple() {
		return Geometry_IsSimple($this->_cPtr);
	}

	public function IsRing() {
		return Geometry_IsRing($this->_cPtr);
	}

	public function Intersects($other) {
		return Geometry_Intersects($this->_cPtr,$other);
	}

	public function Intersect($other) {
		return Geometry_Intersect($this->_cPtr,$other);
	}

	public function Equals($other) {
		return Geometry_Equals($this->_cPtr,$other);
	}

	public function Equal($other) {
		return Geometry_Equal($this->_cPtr,$other);
	}

	public function Disjoint($other) {
		return Geometry_Disjoint($this->_cPtr,$other);
	}

	public function Touches($other) {
		return Geometry_Touches($this->_cPtr,$other);
	}

	public function Crosses($other) {
		return Geometry_Crosses($this->_cPtr,$other);
	}

	public function Within($other) {
		return Geometry_Within($this->_cPtr,$other);
	}

	public function Contains($other) {
		return Geometry_Contains($this->_cPtr,$other);
	}

	public function Overlaps($other) {
		return Geometry_Overlaps($this->_cPtr,$other);
	}

	public function TransformTo($reference) {
		return Geometry_TransformTo($this->_cPtr,$reference);
	}

	public function Transform($trans) {
		return Geometry_Transform($this->_cPtr,$trans);
	}

	public function GetSpatialReference() {
		$r=Geometry_GetSpatialReference($this->_cPtr);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new SpatialReference($r);
			}
			return new $c($r);
		}
		return $r;
	}

	public function AssignSpatialReference($reference) {
		Geometry_AssignSpatialReference($this->_cPtr,$reference);
	}

	public function CloseRings() {
		Geometry_CloseRings($this->_cPtr);
	}

	public function FlattenTo2D() {
		Geometry_FlattenTo2D($this->_cPtr);
	}

	public function Segmentize($dfMaxLength) {
		Geometry_Segmentize($this->_cPtr,$dfMaxLength);
	}

	public function GetEnvelope() {
		Geometry_GetEnvelope($this->_cPtr);
	}

	public function Centroid() {
		$r=Geometry_Centroid($this->_cPtr);
		if (is_resource($r)) {
			$c=substr(get_resource_type($r), (strpos(get_resource_type($r), '__') ? strpos(get_resource_type($r), '__') + 2 : 3));
			if (!class_exists($c)) {
				return new Geometry($r);
			}
			return new $c($r);
		}
		return $r;
	}

	public function WkbSize() {
		return Geometry_WkbSize($this->_cPtr);
	}

	public function GetCoordinateDimension() {
		return Geometry_GetCoordinateDimension($this->_cPtr);
	}

	public function SetCoordinateDimension($dimension) {
		Geometry_SetCoordinateDimension($this->_cPtr,$dimension);
	}

	public function GetDimension() {
		return Geometry_GetDimension($this->_cPtr);
	}
}


?>
