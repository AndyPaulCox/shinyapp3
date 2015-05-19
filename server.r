library(shiny)

# Define server logic required
shinyServer(function(input, output) {

  

 
  #create the output plot / visualisation
  output$histPlot <- renderPlot({
    #Start the code to create teh visualisations
    rm(list = ls())#Clear workspace
    #funtion to return the positions of a list of values from a R object
    #MNOTE uch better ways to do this e.g. %in% I will get round to changing it
     getind<-function(vars,object){
    for(i in 1:length(object)){
        x<-which(object==vars[i])
       if(i==1)y<-x else y<-c(y,x)	
      }
     return(y)
    }
    #load required libraries
    library(TraMineR)
    library(reshape)
    library(cluster)
#read in data
  dictU = read.delim("dictU.csv",sep=",",stringsAsFactors=FALSE)
  TxSeq = read.delim("TxSeq.csv",sep=",",stringsAsFactors=FALSE)
  z0 = read.delim("z0.csv",sep=",",stringsAsFactors=FALSE)
  
  
  #Select Gender conditionally
  if(input$gender=="Male")z0<-z0[z0$gender==1,]
    if(input$gender=="Female")z0<-z0[z0$gender==2,]
      
  #Select Age Range conditionally
  z0<-z0[z0$age>=input$age_range[1] & z0$age<=input$age_range[2]]
  
  #Select subtype conditionally
  if(input$subtype=="Mild" & input$subtype!="Severe")z0<-z0[z0$specFlag==0,]
  if(input$subtype=="Severe" & input$subtype!="Mild"  )z0<-z0[z0$specFlag==1,]
  
  
  z0<-z0[1:100,1:200]
         cc0<-seqdef(z0[,c(6:ncol(z0))])
   seq_alph<-seqstatl(cc0)
    cll<-character(length(seq_alph))
    for(i in 1:length(seq_alph))cll[i]<-as.character(dictU[which(dictU[,4]==seq_alph[i]),5])
    cpal(cc0[,6:ncol(cc0)])<-as.character(dictU[getind(seq_alph,dictU[,4]),5])
    if(input$analysistype=="Sequence Sub Sample")seqiplot(cc0,withlegend=F,xlab="Time since diagnosis (Days)",cex.lab=1.4,cex.main=1.4,
             title="Randomly selected treatment sequences",tlim=sample(1:nrow(cc0),input$sub_sample,replace=F))

  if(input$analysistype=="Frequency")seqplot(cc0,withlegend=F,type="f",xlab="Time since diagnosis (Days)",cex.lab=1.4,cex.main=1.4,
          title="Treatment frequency Plot",ylim=c(0,50))
  if(input$analysistype=="Entropy"){
  EntropyPSO<-seqstatd(cc0)$Entropy
  plot(EntropyPSO,main="Entropy of the state distribution of PsO patients histories", col="black",xlab="Time (Days)",ylab="Entropy",type="l")
  }
  if(input$analysistype=="Turbulence"){
  Turb<-seqST(cc0)
  hist(Turb,main="Histogram of sequence turbulence  of PsO patients histories", col="grey")
  }
if(input$analysistype=="Cluster"){
  submat1 <- seqsubm(cc0, method = "TRATE")
  dist.om1 <- seqdist(cc0, method = "OM", indel = 1,sm = submat1)
  
clusterward1 <- agnes(dist.om1, diss = TRUE, method = "ward")
plot(clusterward1, main="Treatment history clustering",cex.main=3)
}

#output$textDisplay <- renderText({
 # h2("Usage Instructions")#,
  #h3("Background")
  # h4("This application is designed to all allow the user to explore treatement history data using a number of different analysis types")
#})

    })
})