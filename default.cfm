<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="form.css?v1">
    <title>CF form</title>
</head>
<body>

  <!--- elenco validazioni --->

  <cfdump  var="#form#">
  <cfset errorlist = "">
  <cfif isDefined("hidden")>

    <cfif not isNumeric(cap)>
      <cfset errorlist = listAppend(errorlist, "cap")>
    </cfif>
  </cfif>



  <cfdump  var="#errorlist#">

  <!--- params per inputs  --->

  <cfparam  name="name" default="">
  <cfparam  name="surname" default="">
  <cfparam  name="username" default="">
  <cfparam  name="city" default="">
  <cfparam  name="state" default="">
  <cfparam  name="cap" default="">
  <cfparam  name="pizze" default="">
  <cfparam  name="ingredienti" default="">
  <cfparam  name="tipi" default="">
  <cfset lista_tipi = "peperoni,funghi,pomodori,olive">
  
  <!---lista tipologia --->
  <cfset types = Arraynew(1)>
  <cfset types[1] = structNew()>
  <cfset types[1].name = 'rossa'>
  <cfset types[1].value = 1>
  
  <cfset types[2] = structNew()>
  <cfset types[2].name = 'bianca'>
  <cfset types[2].value = 2>

  <cfset types[3] = structNew()>
  <cfset types[3].name = 'integrale'>
  <cfset types[3].value = 3>

  <!---lista pizze --->
  <cfset pizze = Arraynew(1)>
  <cfset pizze[1] = structNew()>
  <cfset pizze[1].name = 'margherita'>
  <cfset pizze[1].value = 1>
  
  <cfset pizze[2] = structNew()>
  <cfset pizze[2].name = 'diavola'>
  <cfset pizze[2].value = 2>

  <cfset pizze[3] = structNew()>
  <cfset pizze[3].name = 'vegetariana'>
  <cfset pizze[3].value = 3>

  <cfset pizze[4] = structNew()>
  <cfset pizze[4].name = 'bufala'>
  <cfset pizze[4].value = 4>

  <div class="container mt-5">
    <cfoutput>
      <form class="needs-validation" action="default.cfm" method="post">
        <input type="hidden" name="hidden">
        <div class="form-row">
          <div class="col-md-4 mb-3">
            <label for="validationTooltip01">First name</label>
            <input type="text" class="form-control" id="validationTooltip01" placeholder="First name" name="name" value="#name#" required>      
              <div class="valid-tooltip">
                Looks good!
              </div>           
          </div>
          <div class="col-md-4 mb-3">
            <label for="validationTooltip02">Last name</label>
            <input type="text" class="form-control" id="validationTooltip02" placeholder="Last name" name="surname" value="#surname#"required>
            <div class="valid-tooltip">
              Looks good!
            </div>
          </div>
          <div class="col-md-4 mb-3">
            <label for="validationTooltipUsername">Username</label>
            <div class="input-group">
              <div class="input-group-prepend">
                <span class="input-group-text" id="validationTooltipUsernamePrepend">@</span>
              </div>
              <input type="text" class="form-control" id="validationTooltipUsername" placeholder="Username" aria-describedby="validationTooltipUsernamePrepend" name="username" value="#username#" required>
              <div class="invalid-tooltip">
                Please choose a unique and valid username.
              </div>
            </div>
          </div>
        </div>
        <div class="form-row">
          <div class="col-md-6 mb-3">
            <label for="validationTooltip03">City</label>
            <input type="text" class="form-control" id="validationTooltip03" placeholder="City" name="city" value="#city#" required>
            <div class="invalid-tooltip">
              Please provide a valid city.
            </div>
          </div>
          <div class="col-md-3 mb-3">
            <label for="validationTooltip04">State</label>
            <input type="text" class="form-control" id="validationTooltip04" placeholder="State" name="state" value="#state#" required>
            <div class="invalid-tooltip">
              Please provide a valid state.
            </div>
          </div>
          <div class="col-md-3 mb-3">
            <label for="validationTooltip05">Zip</label>
            <input type="text" class="form-control" id="validationTooltip05" placeholder="CAP" name="cap" value="#cap#" maxlength="5" required>
            <cfif listFind(errorlist, "cap")>           
             <div class="text-danger">
               Please provide a valid zip.
             </div>
            </cfif>
          </div>
        </div>
        <label for="lista_pizze" id="pizze-select">Scegli la tua pizza:</label>
            <select name="listap" id="pizze">
              <cfloop array="#pizze#" index="p">
                <option name="#p.name#" value=#p.value# <cfif listap EQ p.value> selected </cfif> >#p.name#</option>
              </cfloop>
            </select>
           
       <!--- tipologia pizza --->
        <div class="mt-3">
          <cfloop array="#types#" index="t">
            <input class="me-2" type="radio" id="#t.name#" name="tipi" value= #t.value# <cfif tipi EQ t.value> checked </cfif>>
            <label for="#t.name#">#t.name#</label><br>
          </cfloop>
        </div>

        <!--- ingredienti --->
          <h3 class="mt-3">INGREDIENTI AGGIUNTIVI</h3>
        <div class="mt-3">
          <cfloop list="#lista_tipi#" index="t">
            <input type="checkbox" id="#t#" name="ingredienti" value="#t#" <cfif ListFind( ingredienti, t)> checked> </cfif> 
            <label for="#t#"> #t# </label><br>
          </cfloop>
        </div>
        <button class="btn btn-primary mt-3" type="submit" value="submit">Submit form</button>
      </form>
    </cfoutput>
  </div>
</body>