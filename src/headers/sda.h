#ifndef KSP_WS17_18_SDA_H
#define KSP_WS17_18_SDA_H

#include "../../lib/support.h"

extern unsigned int sdaSize;
extern ObjRef* sda;

void initSda(unsigned int size);
void pushGlobal(unsigned int size);
void popGlobal(unsigned int size);

void purgeSda(void);
void printStaticDataArea(void);
void printStaticDataAreaTo(FILE* stream);

#endif /* KSP_WS17_18_SDA_H */
