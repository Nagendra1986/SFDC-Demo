public class MypdfController {
public String getChooserender() {
     if (ApexPages.currentPage().getParameters().get('p') != null)
        return 'pdf';
        else
      return null;
  }

  public PageReference deliverAsPDF() {
      PageReference pdf =  Page.pdfrendered;
        pdf.getParameters().put('p','p');
        return pdf;
  }

}