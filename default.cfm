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

  <cfset errorlist = "">
  <cfdump  var="#form#">
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
  <cfset lista_tipi = "peperoni,funghi,pomodori,olive">
  
  <cfset ingredients = Arraynew(1)>
  <cfset ingredients[1] = structNew()>
  <cfset ingredients[1].name = 'rossa'>
  <cfset ingredients[1].value = 1>
  
  <cfset ingredients[2] = structNew()>
  <cfset ingredients[2].name = 'bianca'>
  <cfset ingredients[2].value = 2>

  <cfset ingredients[3] = structNew()>
  <cfset ingredients[3].name = 'integrale'>
  <cfset ingredients[3].value = 3>

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
        <label for="pizze" id="pizze-select">Scegli la tua pizza:</label>
            <select name="pizze" id="pizze">
              <option name="margherita" value="1" <cfif pizze eq 1 >selected</cfif> >Margherita</option>
              <option name="diavola" value="2" <cfif pizze eq 2 >selected</cfif> > Diavola</option>
              <option name="vegetariana" value="3" <cfif pizze eq 3 >selected</cfif> >vegetariana</option>
              <option name="bufala" value="4" <cfif pizze eq 4 >selected</cfif> >Bufala</option>
            </select>
           

        <div class="mt-3">
          <cfloop array="#ingredients#" index="i">
            <input type="radio" id="#i.name#" name="ingredienti" value= #i.value# <cfif ingredienti EQ i.value> checked  </cfif>>
            <label for="#i.name#">#i.name#</label><br>
          </cfloop>
        </div>
          <h3 class="mt-3">INGREDIENTI AGGIUNTIVI</h3>
        <div class="mt-3">
          <cfloop list="#lista_tipi#" index="t">
            <input type="checkbox" id="#t#" name="tipi" value="#t#" <cfif ListFind( tipi, t)> checked> </cfif> 
           <label for="#t#"> #t# </label><br>
          </cfloop>
            
        </div>
        <button class="btn btn-primary mt-3" type="submit" value="submit">Submit form</button>
      </form>
    </cfoutput>
  </div>
</body>