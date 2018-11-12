library(mvtnorm)

qdunnett1 <- function(alpha=0.05,t,dof){
  m = t-1
  d1 = qmvt(p=1-alpha,tail='lower.tail',df=dof,corr=matrix(rep(.5,m^2),m)+diag(m)*.5)$quantile
  return(d1)
}

qdunnett2 <- function(alpha=0.05,t,dof){
  m = t-1
  d2 = qmvt(p=1-alpha,tail='lower.tail',df=dof,corr=matrix(rep(.5,m^2),m)+diag(m)*.5)$quantile 
  return(d2)
}

maxHSU <- function(y,groups,alpha=0.05,mse,dof){
  print("WARNING: esta funcion considera que todos los ni son iguales")
  x = as.factor(groups)
  lab = levels(x)
  G = length(lab)
  maxList = NULL;
  idxList = 1
  for (i in 1:G){ # para cada i, busca la media mas grande en el resto de los grupos
    idx = which(x==lab[[i]])
    idx
    labred = lab[-i]
    Mi = -Inf
    for (h in 1:(G-1)){
      meanh = mean(y[x==labred[[h]]])
      Mi = max(meanh,Mi)
    }
    # print(qdunnett1(alpha = alpha,t = G,dof = dof))
    Ki = Mi - qdunnett1(alpha = alpha,t = G,dof = dof)*sqrt(2*mse/length(idx))
  
 #   print(c(lab[[i]],mean(y[idx]),mean(y[idx])-Mi,mean(y[idx])-Mi+116.16))

    if (mean(y[idx])>Ki){
      idxList = idxList+1
      print(lab[[i]])
      maxList[[idxList]]=lab[[i]]
    }
  }
  return(maxList)    
}

minHSU <- function(y,groups,alpha=0.05,mse,dof){
  print("WARNING: esta funcion considera que todos los ni son iguales")
  x = as.factor(groups)
  lab = levels(x)
  G = length(lab)
  minList = NULL;
  idxList = 1
  for (i in 1:G){ # para cada i, busca la media mas grande en el resto de los grupos
    idx = which(x==lab[[i]])
    labred = lab[-i]
    Mi = Inf
    for (h in 1:(G-1)){
      meanh = mean(y[x==labred[[h]]])
      Mi = min(meanh,Mi)
    }
    Ki = Mi + qdunnett1(alpha = alpha,t = G,dof = dof)*sqrt(2*mse/length(idx))
    if (mean(y[idx])<Ki){
      idxList = idxList+1
      print(lab[[i]])
      minList[[idxList]]=lab[[i]]
    }
  }
  return(minList)    
}