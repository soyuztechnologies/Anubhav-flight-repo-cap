sap.ui.define([
    "sap/m/MessageToast",
    "sap/ui/model/json/JSONModel"
], function(MessageToast, JSONModel) {
    'use strict';

    return {
        onPress: function(oEvent) {
            MessageToast.show("Custom handler invoked.");
        },
        onChartSelectionChange: function(oEvent){
            //Step 1: Get The view object
            var oView = this.editFlow.getView();
            //Step 2: Get The local model
            var oPopupModel = oView.getModel("popup");
            //Step 3: Get the object of chart control
            var oPopover = oEvent.getSource().getParent().getDependents()[0];
            //Step 4: Check if there is something selected or not
            if(oEvent.getParameter("selected")){
                //Step 5: get the selection data and set our model with it
                if(!oPopupModel){
                    oPopupModel = new JSONModel();
                    oView.setModel(oPopupModel,"popup");
                }
                oPopupModel.setData(oEvent.getParameter("data")[0].data, true);
                //Step 6: open the popup
                oPopover.openBy(oEvent.getParameter("data")[0].target);
            }
            
        }
    };
});
