#ifndef _QR_DRAW_
#define _QR_DRAW_

#define USE_JPEG
#define USE_PNG
#define USE_TIFF

#define MARGIN_SIZE      4
#define MAX_MODULESIZE 177

class QRDraw
{
	public:
		QRDraw(){
			this->bit_image=NULL;
		}
		
		virtual ~QRDraw(){
			this->close();
		}
		
		void setup(char *filename, int modulesize, int symbolsize){
			this->msize = modulesize;
			this->ssize = symbolsize;
			this->rsize = (this->ssize + MARGIN_SIZE * 2) * this->msize;
			this->filename = filename;
		}
		
	protected:
		unsigned char **bit_image;
		int msize;
		int rsize;
		int ssize;
		char *filename;

	public:
		virtual int draw(char *filename, int modulesize, int symbolsize, 
							unsigned char data[MAX_MODULESIZE][MAX_MODULESIZE], void *opt) = 0;
		void close(){
			int i;
			if(this->bit_image){
				for(i=0; i<this->rsize; i++) free(this->bit_image[i]);
				free(this->bit_image);
			}
			this->bit_image=NULL;
		}
};

#endif
