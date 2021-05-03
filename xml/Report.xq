<html>
<head>
<link rel="preconnect" href="https://fonts.gstatic.com"/>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400" rel="stylesheet"/>
<style>
body {{ font-family: 'Roboto', sans-serif;}}
table {{border-collapse: collapse;}}
table, th, td {{border: 1px solid black;}}
th {{text-align: left}}
th, td {{padding: 10px 5px; vertical-align:top;}}

a.toc {{font-size:small;}}
.info {{font-size:small;}}

</style>
</head>
<body>

<h1>CODATA-DRUM SI Unit System</h1>
<p class='info'>
<span>#quantities: {count(/UnitSystem/Quantities/Quantity)}</span>
<span>| #concepts: {count(/UnitSystem/Concepts/Concept)}</span>
<span>| #constants: {count(/UnitSystem/Constants/Constant)}</span>
<span>| #prefixes: {count(/UnitSystem/Prefixes/Prefix)}</span>
<span>| #units: {count(/UnitSystem/Units/Unit)}</span>
</p>

<hr/>
<h2 id='quantities'>Quantities</h2>
<div class='toc'>
{
let $quantities := /UnitSystem/Quantities
let $units := /UnitSystem/Units
let $allUris := //*/@uri
for $quantity in /UnitSystem/Quantities/Quantity
  let $quantityUri := $quantity/@uri
  let $quantityName := $quantity/Name/Singular[@xml:lang='en']/text()
  order by $quantityName
  return <span><a href='#{$quantityUri}'>{$quantityName}</a>&#160;</span>
}
</div>
{
for $quantity in /UnitSystem/Quantities/Quantity
  let $quantityUri := $quantity/@uri/string()
  let $quantityName := $quantity/Name/Singular[@xml:lang='en']/text()
  let $units := /UnitSystem/Units/Unit[QuantityRef=$quantityUri]
  order by $quantityName
  return <div>
  <h3><a id='{$quantityUri}'>{$quantityName}</a></h3>
  <p>
    <div class="info">
    uri={$quantityUri} | #units:{count($units)}
    </div>
  </p>
  <table>
  <tr><th>Unit</th><th>Symbol</th><th>Definition</th><th>SI Base</th><th>Other Base(s)</th></tr>
  {
    for $unit in $units
    let $unitName := $unit//Name/Singular[@xml:lang='en']/text()
    order by $quantityName
    return
    <tr>
      <td>{$unitName}</td>
      <td>{$unit//Symbol/text()}</td>
      <td style='max-width:400px;'>{$unit/Definition[@xml:lang='en']/text()}</td>
      <td>{
      for $baseUnit in $unit/Base/BaseUnit
        let $baseUnitUnit := /UnitSystem/Units/Unit[@uri=$baseUnit/UnitRef/text()]
        let $baseUnitName :=  $baseUnitUnit/Name/Singular[@xml:lang='en']/text()
        let $baseUnitSymbol :=  $baseUnitUnit/Symbol/text()
        return <span>{$baseUnitSymbol}<sup>{$baseUnit/Exponent/text()}</sup></span>  
      }
      {if($unit/Base/Expression) then <span style='color:#808080'> {$unit/Base/Expression/text()}</span>}
      </td>
      <td>
        {if($unit/AlternateBase) then 
          for $altBase in $unit/AlternateBase
            return <div> {
              for $baseUnit in $altBase/BaseUnit
                let $baseUnitUnit := /UnitSystem/Units/Unit[@uri=$baseUnit/UnitRef/text()]
                let $baseUnitName :=  $baseUnitUnit/Name/Singular[@xml:lang='en']/text()
                let $baseUnitSymbol :=  $baseUnitUnit/Symbol/text()
                return <span>{$baseUnitSymbol}<sup>{$baseUnit/Exponent/text()}</sup></span>  
            }
            {if($altBase/Expression) then <span  style='color:#808080'> {$altBase/Expression/text()}</span>}
            </div>
         else '-'}
      </td>
</tr>
  }
  </table>
  </div>
}

<hr/>
<h2 id='quantities'>Quality Assurance</h2>
<table>
<tr>
<td></td>
</tr>
</table>
</body>
</html>

