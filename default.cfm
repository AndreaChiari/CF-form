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

  <!--- variabili flag per input form --->

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

    <!--- params per select  --->


 
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
        <label for="pizze">Scegli la tua pizza:</label>
            <select name="pizze" id="pizze">
              <option value="margherita">Margherita</option>
              <option value="diavola">Diavola</option>
              <option value="vegetariana">vegetariana</option>
              <option value="bufala">Bufala</option>
            </select>
        <div class="mt-3">
            <input type="radio" id="html" name="rossa" value="HTML">
            <label for="rossa">rossa</label><br>
            <input type="radio" id="css" name="bianca" value="CSS">
            <label for="bianca">bianca</label><br>
            <input type="radio" id="javascript" name="integrale" value="JavaScript">
            <label for="integrale">integrale</label>
        </div>
          <h3 class="mt-3">INGREDIENTI AGGIUNTIVI</h3>
        <div class="mt-3">
            <input type="checkbox" id="vehicle1" name="vehicle1" value="Bike">
            <label for="vehicle1"> peperoni </label><br>
            <input type="checkbox" id="vehicle2" name="vehicle2" value="Car">
            <label for="vehicle2"> funghi</label><br>
            <input type="checkbox" id="vehicle3" name="vehicle3" value="Boat">
            <label for="vehicle3"> pomodori</label><br>
        </div>
        <button class="btn btn-primary mt-3" type="submit" value="submit">Submit form</button>
      </form>
    </cfoutput>
  </div>
</body>