<form id="exA" class="fValidator-form" method="post" action="#">  
    <fieldset>  
        <legend>fValidator</legend>  
        <table>  
            <tfoot>  
                <tr>  
                    <td colspan="2"><input id="exA_submit" type="submit" value="submit" /><input type="reset" value="reset" /></td>  
                </tr>  
            </tfoot>  
            <tbody>  
                <tr>  
                    <td><label for="exA_Id">ID:</label></td>  
                    <td><input id="exA_Id" class="fValidate['required']" name="id" type="text" /></td>  
                </tr>  
                <tr>  
                    <td><label for="exA_Password">Password:</label></td>  
                    <td><input id="exA_Password" class="fValidate['required']" name="password" type="password" /></td>  
                </tr>  
                <tr>  
                    <td><label for="exA_cPassword">Confirm password:</label></td>  
                    <td><input id="exA_cPassword" class="fValidate['required','=exA_Password']" name="cpassword" type="password" /></td>  
                </tr>  
                <tr>  
                    <td><label for="exA_Name">Name:</label></td>  
                    <td><input id="exA_Name" class="fValidate['required','alpha']" name="name" type="text" /></td>  
                </tr>  
                <tr>  
                    <td>Sex:</td>  
                    <td>  
                        <label for="exA_Sex_male">male</label><input id="exA_Sex_male" name="sex" type="radio" value="male" />  
                        <label for="exA_Sex_female">female</label><input id="exA_Sex_female" class="fValidate['required']" name="sex" type="radio" value="female" />  
                    </td>  
                </tr>  
                <tr>  
                    <td><label for="exA_Date">Birthday:</label></td>  
                    <td><input id="exA_Date" class="fValidate['date']" name="date" type="text" /></td>  
                </tr>  
                <tr>  
                    <td><label for="exA_Phone">Phone:</label></td>  
                    <td><input id="exA_Phone" class="fValidate['required','phone']" name="phone" type="text" /></td>  
                </tr>  
                <tr>  
                    <td><label for="exA_Phone2">Phone 2:</label></td>  
                    <td><input id="exA_Phone2" class="fValidate['phone']" name="phone2" type="text" /></td>  
                </tr>  
                <tr>  
                    <td><label for="exA_Email">Email:</label></td>  
                    <td><input id="exA_Email" class="fValidate['required','email']" name="email" type="text" /></td>  
                </tr>  
                <tr>  
                    <td><label for="exA_Url">URL:</label></td>  
                    <td><input id="exA_Url" class="fValidate['required','url']" name="url" type="text" /></td>  
                </tr>  
                <tr>  
                    <td><label for="exA_State">State:</label></td>  
                    <td><select id="exA_State" class="fValidate['required']" name="state">  
                        <option value="">Select one...</option>  
                        <option value="AL">Alabama</option>  
                        <option value="AK">Alaska</option>  
                        <option value="AZ">Arizona</option>  
                        <option value="AR">Arkansas</option>  
                        <option value="CA">California</option>  
                        <option value="CO">Colorado</option>  
                        <option value="CT">Connecticut</option>  
                        <option value="DE">Delaware</option>  
                        <option value="FL">Florida</option>  
                        <option value="GA">Georgia</option>  
                        <option value="HI">Hawaii</option>  
                        <option value="ID">Idaho</option>  
                        <option value="IL">Illinois</option>  
                        <option value="IN">Indiana</option>  
                        <option value="IA">Iowa</option>  
                        <option value="KS">Kansas</option>  
                        <option value="KY">Kentucky</option>  
                        <option value="LA">Louisiana</option>  
                        <option value="ME">Maine</option>  
                        <option value="MD">Maryland</option>  
                        <option value="MA">Massachusetts</option>  
                        <option value="MI">Michigan</option>  
                        <option value="MN">Minnesota</option>  
                        <option value="MS">Mississippi</option>  
                        <option value="MO">Missouri</option>  
                        <option value="MT">Montana</option>  
                        <option value="NE">Nebraska</option>  
                        <option value="NV">Nevada</option>  
                        <option value="NH">New Hampshire</option>  
                        <option value="NJ">New Jersey</option>  
                        <option value="NM">New Mexico</option>  
                        <option value="NY">New York</option>  
                        <option value="NC">North Carolina</option>  
                        <option value="ND">North Dakota</option>  
                        <option value="OH">Ohio value="OH"</option>  
                        <option value="OK">Oklahoma</option>  
                        <option value="OR">Oregon</option>  
                        <option value="PA">Pennsylvania</option>  
                        <option value="RI">Rhode Island</option>  
                        <option value="SC">South Carolina</option>  
                        <option value="SD">South Dakota</option>  
                        <option value="TN">Tennessee</option>  
                        <option value="TX">Texas</option>  
                        <option value="UT">Utah</option>  
                        <option value="VT">Vermont</option>  
                        <option value="VA">Virginia</option>  
                        <option value="WA">Washington</option>  
                        <option value="WV">West Virginia</option>  
                        <option value="WI">Wisconsin</option>  
                        <option value="WY">Wyoming</option>  
                    </select></td>  
                </tr>  
                <tr>  
                    <td><label for="exA_Number">Real (float):</label></td>  
                    <td><input id="exA_Number" class="fValidate['required','real']" name="number" type="text" /></td>  
                </tr>  
            </tbody>  
        </table>  
    </fieldset>  
</form>  